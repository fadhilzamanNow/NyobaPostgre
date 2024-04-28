select * from cars;

select * from mahasiswa;

select * from cars;


alter table cars add rating numeric(5,2);


SELECT * FROM pg_catalog.pg_tables where tablename NOT LIKE ('pg%' AND 'sql%') ;
show tables;
SELECT 
  column_name, 
  data_type, 
  character_maximum_length, 
  is_nullable, 
  column_default 
FROM 
  information_schema.columns 
WHERE 
  table_name = 'cars';


  drop table mahasiswa;