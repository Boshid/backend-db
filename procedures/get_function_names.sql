SELECT routine_schema, routine_name
FROM information_schema.routines
WHERE routine_type = 'PROCEDURE';
