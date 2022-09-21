## SQL Injections
This repo contains a complete application to perform SQL injections.
- The application is a course finder that searches through a database called "unsw" (unsw.sql)
- The python code then returns the results and renders them for a web browser

This application was used in the following videos:
- [SQL Injections - part 1](https://youtu.be/U9Mf6ciKwyE)
- [SQL Injections - part 2](https://youtu.be/3DwlYd7GqE8)

## Installation
Requirements: Python 3
```bash
# run the script for your platform
./install/linux.sh
./install/mac.sh

# common steps
./install/initdb.sh
python3 -m pip install psycopg2-binary flask
```

## Execution
```bash
# run server with unsafe sql query
python3 run.py

# run server resistant to sql injections
python3 run.py --user-safe
```

## Inspecting Database
```bash
# list all databases
psql -l

# enter our database
psql unsw
\d          # list tables
\d people   # list schema of 'people' table
```