select * from cars;

select * from mahasiswa;

select * from cars;


alter table cars add rating numeric(5,2);


SELECT * FROM pg_tables where tablename NOT LIKE 'pg%' ;
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


  insert into cars values (12321,"",2002,12.41231);


  select * from cars;

  create table mahasiswa(
    id SERIAL,
    nama varchar(100),
    constraint id_mhs primary key (id)
  );

  insert into mahasiswa (nama,nama_jurusan) values
  ('Fadhil','Elektro'),
  ('Isfadhillah','Sipil'),
  ('Rudi','Informatika'),
  ('Tri','Elektro'),
  ('Setyadi','Sipil');

  select * from mahasiswa;

truncate mahasiswa;
  create type jurusan as enum('Informatika','Elektro','Sipil');

  alter table mahasiswa add column nama_jurusan jurusan not null;

select * from information_schema.columns where table_name = 'mahasiswa';

  create table mahasiswa2(
    nama varchar(200),
    primary
  );


  update mahasiswa set nama_jurusan = 'Informatika' where nama='Fadhil';

  select * from mahasiswa;



  select * from mahasiswa order by 2;

  delete from mahasiswa where id=10;

  select * from mahasiswa;




  select id NIM, nama "Nama Lengkap" from mahasiswa;

  select * from mahasiswa where nama LIKE '%a';

  select * from mahasiswa where nama LIKE '%a_';
  select * from mahasiswa where nama LIKE '%a%';


  select * from mahasiswa where id BETWEEN 7 AND 9;


  select * from mahasiswa order by nama_jurusan desc,nama desc;


  select * from mahasiswa limit 3;

  select * from mahasiswa offset 2;


select nama_jurusan || ' adalah jurusannya'  Jurusan from mahasiswa;



select currval(pg_get_serial_sequence('mahasiswa','id'));

select test "halo guys";


create sequence naik;


select nextval('naik');




select currval('serial');


create table angkanaik(
    id int not null default nextval('angkanaik_id_seq')
);


select count(id) from mahasiswa;

select nama_jurusan, count(id) from mahasiswa group by nama_jurusan;

select currval('mahasiswa_id_seq');


-- string function 
select id,UPPER(nama) "Nama Lengkap" from mahasiswa;

alter table mahasiswa add tgl_dibuat timestamp default current_timestamp;


insert into mahasiswa(nama,nama_jurusan) VALUES ('pak irham','Elektro');

select * from mahasiswa;

-- date and time function
select extract(year from tgl_dibuat) from mahasiswa;


-- control flow case

select id,nama,case nama 
when 'Fadhil' THEN 'Namaku'
else 'Bukan Namaku'
END "Apakah Namaku? " from mahasiswa;

-- aggregate function

select count(id) "Jumlah Mahasiswa" from mahasiswa;

select nama_jurusan from mahasiswa;

select nama_jurusan from mahasiswa group by nama_jurusan;

-- group by
select nama_jurusan, count(nama) from mahasiswa group by nama_jurusan;


-- having (filter group by)
select nama_jurusan, count(nama) "jumlah" from mahasiswa group by nama_jurusan having jumlah < 2;

-- having dan select tidak bisa memfilter alias
select id "nomor" from mahasiswa where id >8;


create sequence customer_id_seq;
-- constraint

-- unique constraint
create table customer(
  id int not null default nextval('customer_id_seq'),
  email varchar(255) not null,
  first_name varchar(255) not null,
  last_name varchar(255) not null,
  constraint cust_id primary key(id),
  constraint email_uk unique (email)
);


insert into customer (email,first_name,last_name) VALUES
('fadhil@gmail.com','fadhil','isfadhillah'),
('fadhil@gmail.co.id','siapa','aja'); 


select * from customer;

insert into customer (email,first_name,last_name) VALUES
('next@gmail.com','fadhil','isfadhillah'),
('js@gmail.co.id','siapa','aja'); 

select * from customer;


truncate customer;

-- check constraint
alter table customer 
add constraint nama_panjang check (first_name LIKE 'f%');

alter table customer drop constraint nama_panjang;


alter table customer
add constraint huruf_f_check check (first_name ILIKE 'f%');

insert into customer (email,first_name,last_name) 
VALUES
('faadhil@gmail.com','Fest','123');

select * from customer;

-- index