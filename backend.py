import psycopg2

# Connect to database
conn = psycopg2.connect(dbname="unsw")
conn.autocommit = True
cur = conn.cursor()

'''Rollback connection'''
def db_rollback() -> str:
    conn.rollback()
    return 'Server error: We apologize for any inconvenience'

'''Query for courses'''
def run_query(course: str) -> list:
    # Build query
    query = """
    SELECT code, uoc, offering
    FROM subject_summary
    WHERE       code ILIKE '%{}%'
    """.format(course)

    # Print query (for debugging)
    query = cur.mogrify(query)
    print(query.decode("utf-8"))

    # Execute query
    cur.execute(query)

    # Fetch results
    return list(cur.fetchall())

if __name__ == "__main__":
    # For debugging
    l = run_query('comp')
    print(l)