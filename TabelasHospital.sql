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

/*questão 4*/
alter table Hospital.Consulta
add Data datetime

/*questão 5 - o campo ja existe mas o comando seria esse*/
alter table Hospital.Paciente
add dataNascimento datetime

/*questao 6 - a tabela ja existe, mas o comando seria o esse*/
create table Hospital.Especializacao(
	codEspecializacao int primary key,
	nome varchar(50) not null
)

/*questao 7*/
alter table Hospital.Medico
add codEspecializacao int not null

alter table Hospital.Medico
add constraint codEspecializacao
foreign key (codEspecializacao) references Hospital.Especializacao(codEspecializacao)

/*questao 8*/
select year(dataNascimento) 
from Hospital.Paciente
inner join Hospital.Consulta on Hospital.Paciente.idPaciente = Hospital.Consulta.idPaciente
inner join Hospital.Medico on Hospital.Consulta.idMedico = Hospital.Medico.idMedico
inner join Hospital.Especializacao on Hospital.Medico.idEspecializacao = Hospital.Especializacao.idEspecializacao
where Hospital.Especializacao.nome = 'Cardiologista'



/*questão 9*/
select year(dataNascimento)
from Hospital.Paciente
inner join Hospital.Consulta on 

