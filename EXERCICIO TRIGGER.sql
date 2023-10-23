CREATE TABLE pedidos (
IDPedido int auto_increment primary key,
DataPedido DATETIME,
NomeCliente VARCHAR(100)
);

INSERT INTO pedidos (DataPedido, NomeCliente) values 
(NOW(), 'Cliente 1'),
(NOW(), 'Cliente 2'),
(NOW(), 'Cliente 3');

DELIMITER $ 
CREATE TRIGGER RegistroDataCriacaoPedido
BEFORE INSERT ON pedidos
for each row 
begin 

SET NEW.DataPedido = now();

end; $


INSERT INTO pedidos (NomeCliente) values ('Claudio Roberto');


SELECT * FROM pedidos;