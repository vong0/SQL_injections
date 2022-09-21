import argparse
import psycopg2
from flask import Flask, render_template, request

app = Flask(__name__)
conn = psycopg2.connect(dbname="unsw")
conn.autocommit = True
cur = conn.cursor()
use_safe = False


def run_unsafe_query(course: str) -> list:
    query = """
    SELECT code, uoc, offering
    FROM subject_summary
    WHERE code ILIKE '%{}%'
    """.format(course)
    print(query)
    cur.execute(query)
    return list(cur.fetchall())


def run_safe_query(course: str) -> list:
    query = """
    SELECT code, uoc, offering
    FROM subject_summary
    WHERE code ILIKE %s
    """
    query = cur.mogrify(query, ['%' + course + '%']).decode()
    print(query)
    cur.execute(query)
    return list(cur.fetchall())


@app.route('/', methods=['GET', 'POST'])
def home():
    results = None
    errors = None
    query = None
    if request.method == 'POST':
        query = request.form['query']
        try:
            if use_safe:
                results = run_safe_query(query)
            else:
                results = run_unsafe_query(query)
        except Exception:
            conn.rollback()
            errors = 'Server error: We apologize for any inconvenience'
    return render_template('results.html', results=results, errors=errors, query=query)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--use-safe", action="store_true", help="by default query is not safe against sql injections")
    args = parser.parse_args()
    use_safe = args.use_safe
    print("Running server with use_safe={}\n".format(use_safe))
    app.run(debug=True)
    