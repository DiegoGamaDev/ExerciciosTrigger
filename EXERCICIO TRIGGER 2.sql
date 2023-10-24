CREATE TABLE filmes (
id int primary key auto_increment,
titulo varchar(60),
minutos int
);

delimiter $

create trigger chk_minutos before insert on filmes
for each row 
begin 
if NEW.minutos < 0 then
	signal SQLSTATE '45000' 
    SET message_text = "Valor invalido para minutos",
	mysql_errno = 2022;
 set new.minutos = null;
end if;
end; $ 

insert into Filmes (titulo, minutos) values ('The terrible trigger', 120);
insert into Filmes (titulo, minutos) values ('O alto da campadecida', 135);
insert into Filmes (titulo, minutos) values ('Faroeste Caboclo', 240);
insert into Filmes (titulo, minutos) values ('The matrix', 90);
insert into Filmes (titulo, minutos) values ('Blade runner ', -88);
insert into Filmes (titulo, minutos) values ('O labirinto do fauno', 110);
insert into Filmes (titulo, minutos) values ('Metropole', 0);
insert into Filmes (titulo, minutos) values ('A lista', 120);

select * from Filmes;

