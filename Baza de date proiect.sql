create database service_auto;
-- creare tabel clienti
create table clienti(
id int not null,
nume_client varchar (15) not null,
prenume_client varchar (15) not null,
email varchar (15) not null,
nr_telefon varchar (13) not null,
adresa varchar (50)
);
-- adaug cheie primara in tabela clienti
alter table clienti
add constraint primary key (id);

-- adaug auto increment dupa ce am creat tabela
alter table clienti
modify id int auto_increment;

-- creare tabel masini
create table masini
(cod_auto int primary key not null,
marca varchar (25) not null,
model varchar (25) not null,
an_fabricatie int not null
);

-- modific numele tabelei masini in autoturisme
alter table masini
rename to autoturisme;

-- modific tipul unei coloane
alter table autoturisme
modify column model varchar (20) not null;

-- creare tabela mecanici
create table mecanici
(cod_mecanic int primary key not null,
nume varchar (20) not null,
prenume varchar (20) not null,
telefon varchar (10) not null
);

-- creare tabela programari
create table programari
(cod_programare int primary key not null,
cod_mecanic int not null,
cod_auto int not null,
data_programare datetime not null,
foreign key (cod_mecanic) references mecanici (cod_mecanic),
foreign key (cod_auto) references autoturisme (cod_auto)
);

-- creare tabela defectiuni
create table defectiuni
(cod_defect int primary key not null,
nume_defect varchar (20) not null
);

-- adaugare coloana tonaj in tabela autoturisme
alter table autoturisme
add column tonaj int not null;

-- stergere coloana tonaj in tabela autoturisme
alter table autoturisme
drop column tonaj;
alter table clienti
modify column email varchar(30);

insert into clienti(id,nume_client,prenume_client,email, nr_telefon, adresa)
values
("1","Ionescu","Adrian","ionescuadi@yahoo.com","0723458745","str. Margaretei nr 2"),
("2","Zamfir","Laurentiu","laurentiuzamfir@yahoo.com","0745124789","str. Chisinau nr 10"),
("3","Tudor","Marcel","marceltudor@yahoo.com","0725852145","str. Paris nr92"),
("4","Marin","ion","ionmarin@yahoo.com","0758721458","str Franta nr 85"),
("5","Ionescu","Maria","ionescumaria@gmail.com","0745289978","str Preciziei nr 10");

select * from clienti;
insert into autoturisme
values 
("101", "Dacia","Sandero","2015"),
("102","Skoda", "Fabia","2005"),
("103","Ford","Mondeo","2017"),
("104","Toyota","Yaris","2021"),
("105","Dacia","Logan","2019");
select * from autoturisme;
insert into mecanici
values
("201","Dragu","Ionut","0745897452"),
("202","Ionescu","Mircea","0748895219"),
("203","Anton","Cristi","0785478145"),
("204","Marin","Vasile","0785987418"),
("205","Pana","Cristi","0721485741");
select * from mecanici;
insert into defectiuni
values
("401","planetara dreapta"),
("402","capete de bara"),
("403","scurgeri ulei"),
("404","scurgeri apa"),
("405","ardere becuri");
select * from defectiuni;
insert into programari
values
("301","202","103","2024-05-18 09:15:00"),
("302","205","101","2024-07-19 08:10:00"),
("303","201","105","2024-05-09 11:20:00"),
("304","204","102","2024-07-05 10:20:00");
select * from programari;
-- update modifica o data deja existenta in tabel
update programari set data_programare="2024-07-09" where cod_auto="102";
update autoturisme set an_fabricatie="2020" where cod_auto="105";
select * from autoturisme;
-- variatii ce includ where,and, or, not,like,inner joi, left join
select * from clienti where prenume_client="Adrian" or prenume_client="Ion";
select * from autoturisme where an_fabricatie between 2015 and 2019;
update autoturisme set model ="Lodgy" where marca like "Dacia";
select * from defectiuni where nume_defect not  like "ardere becuri";
desc defectiuni;
delete from programari where cod_auto="101";
select * from programari;
select  max(an_fabricatie) from autoturisme;
select min(an_fabricatie) from autoturisme;
select avg(an_fabricatie) from autoturisme;
select count(*) from clienti;
-- cross join
select * from clienti join autoturisme;
update clienti set prenume_client="Cristi" where prenume_client="Adrian";
alter table defectiuni
add column marca varchar (30) not null;
select * from defectiuni;

-- inner join
select * from autoturisme inner join mecanici on prenume ="Cristi";
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

-- SUBQUERIES selectam marca auto cu cea mai mare data de fabricatie din tabelul autoturisme
select marca from autoturisme 
where an_fabricatie =(select Max(an_fabricatie) from autoturisme);





  

update autoturisme 










