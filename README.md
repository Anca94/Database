# **Database project for service auto**

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **service auto**

Tools used: MySQL Workbench

Database description:we created the database **service auto** to organize and manage the information about the customers who attend the service, to be able to make appointments easily and to see the history of the cars.

1. Database Schema:

You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
The tables are connected in the following way:

-**mecanici** is connected with **programari** through a 1:n relationship which was implemented through mecanici.cod_mecanic as a primary key and programari.fk_programari_mecanici as a foreign key

2. Database Queries

i .DDL (Data Definition Language)
The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

create database service_auto;

create table clienti(
id int not null,
nume_client varchar (15) not null,
prenume_client varchar (15) not null,
email varchar (15) not null,
nr_telefon varchar (13) not null,
adresa varchar (50)

create table masini
(cod_auto int primary key not null,
marca varchar (25) not null,
model varchar (25) not null,
an_fabricatie int not null
);

create table mecanici
(cod_mecanic int primary key not null,
nume varchar (20) not null,
prenume varchar (20) not null,
telefon varchar (10) not null
);

create table programari
(cod_programare int primary key not null,
cod_mecanic int not null,
cod_auto int not null,
data_programare datetime not null,
foreign key (cod_mecanic) references mecanici (cod_mecanic),
foreign key (cod_auto) references autoturisme (cod_auto)
);

create table defectiuni
(cod_defect int primary key not null,
nume_defect varchar (20) not null
);

After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:

alter table clienti
add constraint primary key (id);

alter table clienti
modify id int auto_increment;

alter table masini
rename to autoturisme;

alter table autoturisme
modify column model varchar (20) not null;

alter table autoturisme
add column tonaj int not null;

alter table autoturisme
drop column tonaj;
alter table clienti
modify column email varchar(30);

ii. DML (Data Manipulation Language)
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.

Below you can find all the insert instructions that were created in the scope of this project:

insert into clienti(id,nume_client,prenume_client,email, nr_telefon, adresa)

values

("1","Ionescu","Adrian","ionescuadi@yahoo.com","0723458745","str. Margaretei nr 2"),
("2","Zamfir","Laurentiu","laurentiuzamfir@yahoo.com","0745124789","str. Chisinau nr 10"),

("3","Tudor","Marcel","marceltudor@yahoo.com","0725852145","str. Paris nr92"),

("4","Marin","ion","ionmarin@yahoo.com","0758721458","str Franta nr 85"),

("5","Ionescu","Maria","ionescumaria@gmail.com","0745289978","str Preciziei nr 10");

insert into autoturisme
values 
("101", "Dacia","Sandero","2015"),

("102","Skoda", "Fabia","2005"),

("103","Ford","Mondeo","2017"),

("104","Toyota","Yaris","2021"),

("105","Dacia","Logan","2019");

insert into mecanici

values

("201","Dragu","Ionut","0745897452"),

("202","Ionescu","Mircea","0748895219"),

("203","Anton","Cristi","0785478145"),

("204","Marin","Vasile","0785987418"),

("205","Pana","Cristi","0721485741");

insert into defectiuni

values

("401","planetara dreapta"),

("402","capete de bara"),

("403","scurgeri ulei"),

("404","scurgeri apa"),

("405","ardere becuri");

insert into programari

values

("301","202","103","2024-05-18 09:15:00"),

("302","205","101","2024-07-19 08:10:00"),

("303","201","105","2024-05-09 11:20:00"),

("304","204","102","2024-07-05 10:20:00");
);

After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

update programari set data_programare="2024-07-09" where cod_auto="102";

update autoturisme set an_fabricatie="2020" where cod_auto="105";

update autoturisme set model ="Lodgy" where marca like "Dacia";

iii. DQL (Data Query Language)
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:

alter table autoturisme
drop column tonaj;

In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

select * from clienti where prenume_client="Adrian" or prenume_client="Ion";

select * from autoturisme where an_fabricatie between 2015 and 2019;

update autoturisme set model ="Lodgy" where marca like "Dacia";

select * from defectiuni where nume_defect not  like "ardere becuri";

select  max(an_fabricatie) from autoturisme;

select min(an_fabricatie) from autoturisme;

select avg(an_fabricatie) from autoturisme;

select count(*) from clienti;

select autoturisme.cod_auto, programari.cod_auto, marca, model, data_programare, cod_programare from
autoturisme
inner join programari
on autoturisme.cod_auto=programari.cod_auto;

-- left join

select autoturisme.cod_auto, programari.cod_auto, marca, model, data_programare, cod_programare from
autoturisme
left join programari
on autoturisme.cod_auto=programari.cod_auto;

-- right join
select autoturisme.cod_auto, programari.cod_auto, marca, model, data_programare, cod_programare from
autoturisme
right join programari
on autoturisme.cod_auto=programari.cod_auto;

 SUBQUERIES 
select marca from autoturisme 
where an_fabricatie =(select Max(an_fabricatie) from autoturisme);

3. Conclusions

   The database is a tool that helps us collect and organize information.
   
These instructions help us to manage the information in the database more easily and to keep records 
programmers.

By making links between the tables in the car service database, we can open pre-orders and make repair orders for cars that are registered through appointments.

Analyzing the defect table and the defect_cod column, the necessary parts are ordered.

By code_mecanic, the workshop is organized according to the mechanics who are present on the respective day

After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:
