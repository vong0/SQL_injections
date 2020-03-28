This repo contains a complete application to perform SQL injections.
- The application is a course finder that searches through a database called "unsw" (unsw.sql)
- The python code then returns the results and renders them for a web browser

Requirements:
- python 3+, psycopg2, Flask, PostgreSQL

Install guide:
- pip3 install psycopg2
- pip3 install flask

There are 2 main branches:
- master: contains the SQL injection prone code
- stop_sql_injections: contains a fix to prevent SQL injections

This application was used in the following videos:
- [SQL Injections - part 1](https://www.youtube.com/channel/UCNCJv_6ohdTcQXm8YkxTj9g)
- [SQL Injections - part 2](https://www.youtube.com/channel/UCNCJv_6ohdTcQXm8YkxTj9g)
