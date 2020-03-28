from flask import Flask, render_template, request, redirect, url_for, abort
from backend import run_query, db_rollback

app = Flask(__name__)

'''Home page'''
@app.route('/', methods=['GET', 'POST'])
def home():
    results = None
    errors = None
    query = None

    # Run query for courses
    if request.method == 'POST':
        query = request.form['query']
        try:
            results = run_query(query)
        except Exception:
            errors = db_rollback()
    return render_template('results.html', results=results, errors=errors, query=query)