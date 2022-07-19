-- creez o DB
create database orangeHRM ;

create table projects(
	CustomerName char(25) not null,
    Name char(50) not null,
    ProjectAdmin char(50) not null,
    Description char(100)
);

-- adaugarea unei coloane intr-o tabela
alter table projects  add column Project_Id int  first ;

alter table projects modify  FinishDate date not null ;

-- modific tipul de data al coloanei
alter table projects modify Description char (190) not null;

/*stergerea unei coloane din tabela-doua instructiuni echivalente*/
alter table owners drop age;

/*instructiuneade CHANGE ne ajuta sa schimbam numele unei coloane*/
alter table projects change Name ProjectName char(30) not null;

-- ma folosesc de instructiunea INSERT INTO pt a introducce date in coloane
INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES 
('Global Corporation', 'Global Software phase 1', 'Paul Mathew', 'this project describe the organisation and management structure');



INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES 
('Global Corporation', 'Global Software phase 2', 'Paul Mathew', 'this project describe the organisation and management structure');

INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES 
('The Priceline Group', 'Priceline Group  Phase 1', 'Steven Mark');
INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES
('The Priceline Group', 'Priceline Group - Phase 2', 'Steven Mark');
INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES
('Aretail Company', 'New Consumers', 'Jenna Davis',' update online services to consumers');
INSERT INTO projects(CustomerName,Name, ProjectAdmin, Description) VALUES
('ArtGame Company', 'Game of Stars -phase 1', 'James Andrew','This project will develop a module offered to level 2 Game of Stars');

update projects set CustomerName="SlapClub" where CustomerName="Aretail Company" ;
update projects set Name="Slap_upgrade" where CustomerName="SlapClub" ;
update projects set CustomerName="SlapClub" where CustomerName="Aretail Company" ;
update projects set ProjectAdmin="Tim Johnson" where CustomerName="SlapClub" ;
update projects set Description="This project will develop new documentation" where CustomerName="SlapClub" ;

update projects set Project_Id=1 where CustomerName="Global Corporation" ;
update projects set Project_Id=2 where ProjectName="Global Software phase 2" ;
update projects set Project_Id=3 where CustomerName="A-retail Company" ;
update projects set Project_Id=4 where CustomerName="SlapClub" ;
update projects set Project_Id=5 where CustomerName="ArtGame Company" ;

update projects set FinishDate='2022-10-20' where CustomerName="Global Corporation" ;
update projects set FinishDate='2023-01-01' where ProjectName="Global Software phase 2" ;
update projects set FinishDate='2023-06-20' where CustomerName="A-retail Company" ;
update projects set FinishDate='2024-01-01' where CustomerName="SlapClub" ;
update projects set FinishDate='2024-06-20' where CustomerName="ArtGame Company" ;

select * from projects ;

-- ma folosesc de functia count
SELECT COUNT(*) FROM projects;

-- am selectionat cu conditia WHERE
SELECT Name FROM projects WHERE ProjectAdmin='Paul Mathew';

SELECT ProjectName, COUNT(*) FROM projects GROUP BY ProjectName;

-- filtrare cu AND si OR , AND are prioritate in favoarea OR
select * from projects
where (ProjectName like "Slap_upgrade"
or CustomerName  like 'Global Corporation')
and FinishDate="2023-01-01";


UPDATE Projects
SET ProjectAdmin = 'Nick Nikolai'
WHERE ProjectName = 'Global Software phase 2';


DELETE FROM projects 
WHERE
    Project_Id = 3;

----------- primary key ----------------

alter table projects modify column Project_Id  int  primary key ; 

----------- foreign key ----------------

create table Activities (
ActivityName varchar(45) not null,
Admin_user int,
primary key(ActivityName),
constraint fk_projects_Activities foreign key (Admin_user) references projects(Project_Id)
);
insert into  Activities (ActivityName)
values ("Customizations");

insert into  Activities (ActivityName)
values ("Feature Development");

insert into  Activities (ActivityName)
values ("Bug Fixes");

insert into  Activities (ActivityName)
values ("Administration");

select * from Activities;

-- am folosit functia de cross join 
select * from projects cross join Activities;