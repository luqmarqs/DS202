/*LISTA DE EXERCÍCIOS 1
	DS202 - 2s/2022
*/

create schema Hospital

create table Hospital.Especializacao(
	idEspecializacao int primary key,
	nome varchar(30) not null
)

create table Hospital.Medico(
	idMedico int primary key,
	nome varchar(50) not null,
	idEspecializacao int not null,
	CRM varchar(20) not null,
	foreign key(idEspecializacao) references Hospital.Especializacao(idEspecializacao)
)

create table Hospital.Paciente(
	idPaciente int primary key,
	Nome varchar(50) not null,
	endereco varchar(100) not null,
	cidade varchar(50) not null,
	UF char(2) not null,
	dataNascimento datetime not null,
	telefone varchar(20) not null
)

create table Hospital.Consulta(
	idConsulta int,
	idMedico int not null,
	idPaciente int not null,
	dataConsulta datetime not null,
	descricao varchar(200) not null,
	foreign key(idMedico) references Hospital.Medico(idMedico),
	foreign key(idPaciente) references Hospital.Paciente(idPaciente)
)


insert into Hospital.Especializacao values(1, 'Pediatria')
insert into Hospital.Especializacao values(2, 'Obstetrícia')
insert into Hospital.Especializacao values(3, 'Psiquiatria')
insert into Hospital.Especializacao values(4, 'Reumatologia')

insert into Hospital.Medico values(1, 'Carlos de Barros', 2, '98989-54')
insert into Hospital.Medico values(2, 'Rodrigo Coimbra', 1, '92943-67')
insert into Hospital.Medico values(3, 'Paulo Costa', 4, '80343-46')
insert into Hospital.Medico values(4, 'João Pedro Mattos', 3, '95343-15')

insert into Hospital.Paciente values(1, 'Jose Silva', 'Rua X, 25', 'Campinas', 'SP', 22/08/1968, '3256-8923')
insert into Hospital.Paciente values(2, 'Carlos Bueno', 'Rua A, 14', 'Campinas', 'SP', 05/07/1978, '3231-3545')
insert into Hospital.Paciente values(3, 'Regina Saldanha', 'Rua C, 35', 'Sumaré', 'SP', 14/10/2000, '3865-3431')
insert into Hospital.Paciente values(4, 'Silvia Oliveira', 'Rua F, 38', 'Campinas', 'SP', 06/09/1985, '3276-3822')
insert into Hospital.Paciente values(5, 'Teresa Martin', 'Rua G, 87', 'Sumaré', 'SP', 02/04/1999, '3865-2943')
insert into Hospital.Paciente values(6, 'Cristina Sales', 'Rua O, 98', 'Sumaré', 'SP', 20/07/1985, '3865-1984')
insert into Hospital.Paciente values(7, 'Fernando Freitas', 'Rua J, 89', 'Campinas', 'SP', 06/02/1998, '3252-4587')
insert into Hospital.Paciente values(8, 'Raquel Monteiro', 'Rua W, 32', 'Cambui', 'MG', 19/01/1940, '(45)343-4627')

insert into Hospital.Consulta values(1, 2, 5, 31/12/2017, 'Gripe')
insert into Hospital.Consulta values(2, 3, 1, 23/03/2018, 'Reumatismo')
insert into Hospital.Consulta values(3, 2, 3, 16/05/2018, 'Dor de cabeça')
insert into Hospital.Consulta values(4, 2, 7, 27/05/2018, 'Dor de cabeça')
insert into Hospital.Consulta values(5, 1, 6, 29/05/2018, 'Parto')
insert into Hospital.Consulta values(6, 4, 2, 26/07/2018, 'Depressão')
insert into Hospital.Consulta values(7, 2, 5, 17/08/2018, 'Tireóide')
insert into Hospital.Consulta values(8, 4, 4, 25/09/2018, 'Depressão')
insert into Hospital.Consulta values(9, 3, 8, 10/10/2018, 'Dores nas pernas')

select * from Hospital.Consulta
select * from Hospital.Paciente


//corrigindo os errinhos na inserção de dados
update Hospital.Consulta
Set dataConsulta = '31/12/2017'
Where idConsulta = 1

update Hospital.Consulta
Set dataConsulta = '23/03/2018'
Where idConsulta = 2

update Hospital.Consulta
Set dataConsulta = '16/05/2018'
Where idConsulta = 3

update Hospital.Consulta
Set dataConsulta = '27/05/2018'
Where idConsulta = 4

update Hospital.Consulta
Set dataConsulta = '29/05/2018'
Where idConsulta = 5

update Hospital.Consulta
Set dataConsulta = '26/07/2018'
Where idConsulta = 6

update Hospital.Consulta
Set dataConsulta = '17/08/2018'
Where idConsulta = 7

update Hospital.Consulta
Set dataConsulta = '25/09/2018'
Where idConsulta = 8

update Hospital.Consulta
Set dataConsulta = '10/10/2018'
Where idConsulta = 9

update Hospital.Paciente
Set dataNascimento = '22/08/1968'
Where idPaciente = 1
update Hospital.Paciente
Set dataNascimento = '05/07/1978'
Where idPaciente = 2
update Hospital.Paciente
Set dataNascimento = '14/10/2000'
Where idPaciente = 3
update Hospital.Paciente
Set dataNascimento = '06/09/1985'
Where idPaciente = 4
update Hospital.Paciente
Set dataNascimento = '02/04/1999'
Where idPaciente = 5
update Hospital.Paciente
Set dataNascimento = '20/07/1985'
Where idPaciente = 6
update Hospital.Paciente
Set dataNascimento = '06/02/1998'
Where idPaciente = 7
update Hospital.Paciente
Set dataNascimento = '19/01/1940'
Where idPaciente = 8

select * from Hospital.Consulta
select * from Hospital.Paciente

/*questao 3*/
select * from Hospital.Consulta
Where idMedico = 1 and dataConsulta between '01/01/2018' and '31/12/2018'


/*ou*/

select count(idConsulta) from Hospital.Consulta c
inner join Hospital.Medico m on c.idMedico = m.idMedico
where
m.nome = 'Carlos de Barros' and
year(c.dataConsulta) = 2018

/*questão 4*/
alter table Hospital.Consulta
add Data datetime null

/*questão 5 - o campo ja existe mas o comando seria esse*/
alter table Hospital.Paciente 
add dataNascimento datetime null

/*questao 6 - a tabela ja existe, mas o comando seria o esse*/
create table Hospital.Especializacao(
	codEspecializacao int primary key,
	nome varchar(50) not null
)

/*questao 7*/
alter table Hospital.Medico
add codEspecializacao int

alter table Hospital.Medico
add constraint codEspecializacao
foreign key (codEspecializacao) references Hospital.Especializacao(codEspecializacao)

/*questao 8*/

--inner join
select year(dataNascimento) 
from Hospital.Paciente
inner join Hospital.Consulta on Hospital.Paciente.idPaciente = Hospital.Consulta.idPaciente
inner join Hospital.Medico on Hospital.Consulta.idMedico = Hospital.Medico.idMedico
inner join Hospital.Especializacao on Hospital.Medico.idEspecializacao = Hospital.Especializacao.idEspecializacao
where Hospital.Especializacao.nome = 'Cardiologista'

--alias
select year(dataNascimento)
from
Hospital.Paciente p,
Hospital.Consulta c,
Hospital.Medico m,
Hospital.Especializacao e
where
p.idPaciente = c.idPaciente and
c.idMedico = m.idMedico and
m.idEspecializacao = e.idEspecializacao and
e.nome = 'Pediatria'



/*questão 9*/

--inner join
select count(p.idPaciente) from Hospital.Paciente p
inner join Hospital.Consulta c on p.idPaciente = c.idPaciente
where
cidade != 'Campinas' and
year(c.dataConsulta) = 2017

--alias
select count(p.idPaciente)
from
Hospital.Paciente p,
Hospital.Consulta c
where
p.idPaciente = c.idPaciente and
p.cidade != 'Campinas' and
year(c.dataConsulta) = 2017


/* questão 10*/

--inner join
select m.nome as 'Médico', e.nome as 'Especialização', p.nome as 'Paciente'
from Hospital.Medico m
inner join Hospital.Especializacao e on m.idEspecializacao = e.idEspecializacao
inner join Hospital.Consulta c on c.idMedico = m.idMedico
inner join Hospital.Paciente p on c.idPaciente = p.idPaciente
where
year(c.dataConsulta) = 2018 and month(c.dataConsulta) = 7
order by c.dataConsulta

--alias
select m.nome as 'Médico', e.nome as 'Especialização', p.nome as 'Paciente'
from
Hospital.Medico m,
Hospital.Especializacao e,
Hospital.Consulta c,
Hospital.Paciente p
where
m.idEspecializacao = e.idEspecializacao and
m.idMedico = c.idMedico and
c.idPaciente = p.idPaciente and
month(c.dataConsulta) = 7 and
year(c.dataConsulta) = 2018
order by c.dataConsulta

/*Questão 11*/

update Hospital.Consulta set dataConsulta = '01/05/2018'
where idMedico in (select idMedico from Hospital.Medico where nome = 'Rodrigo Coimbra')   ----- select para localizar o id correto do médico
and month(dataConsulta) = 5 and year(dataConsulta) = 2018

/*Questão 12*/

--inner join
select p.nome as 'Paciente', p.telefone as 'Telefone', m.nome as 'Médico' from Hospital.Paciente p
inner join Hospital.Consulta c on p.idPaciente = c.idPaciente
inner join Hospital.Medico m on c.idMedico = m.idMedico
where month(c.dataConsulta) = 9 and year(c.dataConsulta)=2018 and c.descricao = 'Dor de cabeça' or c.descricao = 'Febre'
order by p.Nome

--alias
select p.nome as 'Paciente', p.telefone as 'Telefone', m.nome as 'Médico'
from
Hospital.Paciente p,
Hospital.Consulta c,
Hospital.Medico m
where
p.idPaciente = c.idPaciente and
c.idMedico = m.idMedico and
month(c.dataConsulta) = 9 and year(c.dataConsulta) = 2018 and c.descricao = 'Dor de cabeça' or c.descricao = 'Febre' 

/*Questão 13*/

sp_help 'Hospital.Especializacao'

sp_help 'Hospital.Medico'