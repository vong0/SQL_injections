SELECT ? FROM ? WHERE ? ILIKE '%?%';

SELECT schemaname, tablename, tableowner FROM pg_catalog.pg_tables; 

SELECT ? FROM ? WHERE ? ILIKE '%.' UNION SELECT schemaname, tablename, tableowner FROM pg_catalog.pg_tables; --%';