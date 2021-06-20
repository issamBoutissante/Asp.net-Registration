create database ExercicesderevisionWCS2
go
use ExercicesderevisionWCS2
go
create table Utilisateur(
Nom varchar(30) primary key, 
[password] varchar(30)
)  
insert into Utilisateur values('Boutissante','Boutissante')

create table Region(
idRegion int primary key identity(1,1),
nomRegion varchar(30)
)
insert into Region values('Marrakech-Safi')

create table ProvincePrefecture(
idProvPref int primary key identity(1,1),
nomProvPref varchar(30),
idRegion int,
constraint idRegion_Region foreign key(idRegion) references Region(idRegion)
)
insert into ProvincePrefecture values('Marakech-Safi',1)

create table Circonscription(
idCirconscription int primary key identity(1,1),
nomCir varchar(30),
NombreSiege int,
idProvPref int,
constraint idProvPref_ProvincePrefecture foreign key(idProvPref) references ProvincePrefecture(idProvPref)
)
insert into Circonscription values('azli',3,1)

create table Parti(
idParti int primary key identity(1,1),
nomParti varchar(30),
)
insert into Parti values('Al-Ahrar')


create table TrancheAge(
idTranche int primary key identity(1,1),
tranche varchar(30)
)
insert into TrancheAge values('tranche-1')
insert into TrancheAge values('tranche-2')

create table Candidat(
CINCandidat varchar(8) primary key ,
nomCandidat varchar(30),
prenomCandidat varchar(30),
dateNC date,
niveauScolaire varchar(50),
NumOrdreListe int,
adrCandidat varchar(50),
idCirconscription int,
idParti int,
idTrancheAge int,
constraint idCirconscription_Circonscription foreign key(idCirconscription) references Circonscription(idCirconscription),
constraint idParti_Parti foreign key(idParti) references Parti(idParti),
constraint idTrancheAge_TrancheAge foreign key(idTrancheAge) references TrancheAge(idTranche)
)
insert into Candidat values('EE24234','Sghir','Hassan','02-03-2000','Bac',1,'Marrakech-Azli',1,1,1)

