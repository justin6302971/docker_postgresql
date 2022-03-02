--database
CREATE DATABASE sampledb
    WITH 
    OWNER = tempuser_local
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

--create extension
CREATE EXTENSION "uuid-ossp"

--schema
CREATE SCHEMA sp
AUTHORIZATION tempuser_local;

-- drop table car,person;
CREATE TABLE IF NOT EXISTS sp.person(
	id uuid DEFAULT uuid_generate_v4() not null PRIMARY KEY ,
	first_name varchar(50) not null,
	last_name varchar(50) not null
);

CREATE TABLE IF NOT EXISTS sp.car(
 	id bigserial not null primary key,
	name varchar(50) not null,
	price numeric(19,2) not null,
	person_id uuid references sp.person (id),
	unique(person_id)
);


insert into sp.car(name,price) values ('land rover','20000'),('gmc','30000.5');
insert into sp.person(first_name,last_name) values ('justin','chien'),('hengi','chien');
update sp.car set person_id =(select id from sp.person  where first_name like '%justin%' limit 1) where name like '%land%' 


select * from sp.car;
select * from sp.person ;

select c.*,p.* from sp.car as c left join sp.person as p on c.person_id=p.id where p.id is null
select c.*,p.* from sp.car as c inner join sp.person as p on c.person_id=p.id
select c.*,p.* from sp.car as c left join sp.person as p on c.person_id=p.id
select c.*,p.* from sp.car as c full outer join sp.person as p on c.person_id=p.id

-- select * from sp.car where name like '%land%'
-- select id from sp.person  where first_name like '%justin%' limit 1


-- insert into person(first_name,last_name,car_id) values ('justin1','chien1',1),('hengi2','chien2',2);
--  insert into person(first_name,last_name,car_id) values ('justin4','chien4',4);
-- select * from car;
-- select * from person;


--create table with uuid(uuid-ossp extension)
-- SELECT uuid_generate_v4();

-- CREATE TABLE contacts (
--     contact_id uuid DEFAULT uuid_generate_v4() not null PRIMARY KEY ,
--     first_name VARCHAR NOT NULL,
--     last_name VARCHAR NOT NULL,
--     email VARCHAR NOT NULL,
--     phone VARCHAR
-- );

-- INSERT INTO contacts (
--     first_name,
--     last_name,
--     email,
--     phone
-- )
-- VALUES
--     (
--         'John',
--         'Smith',
--         'john.smith@example.com',
--         '408-237-2345'
--     ),
--     (
--         'Jane',
--         'Smith',
--         'jane.smith@example.com',
--         '408-237-2344'
--     ),
--     (
--         'Alex',
--         'Smith',
--         'alex.smith@example.com',
--         '408-237-2343'
--     );
	
-- SELECT
--     *
-- FROM
--     contacts;