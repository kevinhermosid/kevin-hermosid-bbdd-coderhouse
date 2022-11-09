CREATE SCHEMA IF NOT EXISTS bbddVet;
USE bbddVet ;

-- -----------------------------------------------------
-- empleados
-- -----------------------------------------------------
CREATE TABLE empleados (
  idEmpleados INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NULL,
  telefono VARCHAR(20) NULL,
  direccion VARCHAR(40) NULL,
  PRIMARY KEY (idEmpleados));


-- -----------------------------------------------------
-- cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(40) NULL,
  telefono VARCHAR(20) NULL,
  dni INT NULL,
  direccion VARCHAR(40) NULL,
  mail VARCHAR(70) NULL,
  PRIMARY KEY (idCliente));


-- -----------------------------------------------------
-- ticket
-- -----------------------------------------------------
CREATE TABLE ticket (
  idTicket INT NOT NULL AUTO_INCREMENT,
  fechaFactura DATETIME NULL,
  empleados_idEmpleados INT NOT NULL,
  cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idTicket),
    FOREIGN KEY (empleados_idEmpleados)
    REFERENCES empleados (idEmpleados),
    FOREIGN KEY (cliente_idCliente)
    REFERENCES cliente (idCliente));


-- -----------------------------------------------------
-- proveedor
-- -----------------------------------------------------
CREATE TABLE  proveedor (
  idProveedor INT NOT NULL,
  proveedorNombre VARCHAR(40) NULL,
  direccion VARCHAR(40) NULL,
  telefono VARCHAR(20) NULL,
  PRIMARY KEY (idProveedor));


-- -----------------------------------------------------
-- categoriaProducto
-- -----------------------------------------------------
CREATE TABLE categoriaProducto (
  idCategoriaProducto INT NOT NULL AUTO_INCREMENT,
  categoriaNombre VARCHAR(45) NULL,
  Descripcion VARCHAR(500) NULL,
  PRIMARY KEY (idCategoriaProducto));


-- -----------------------------------------------------
-- producto
-- -----------------------------------------------------
CREATE TABLE producto (
  idProducto INT NOT NULL,
  nombre VARCHAR(40) NULL,
  precioUnitario DECIMAL(6,2) NULL,
  stockActual INT NULL,
  stockMinimo INT NULL,
  proveedor_idProveedor INT NOT NULL,
  categoriaProducto_idCategoriaProducto INT NOT NULL,
  PRIMARY KEY (idProducto),
    FOREIGN KEY (proveedor_idProveedor)
    REFERENCES proveedor (idProveedor),
    FOREIGN KEY (categoriaProducto_idCategoriaProducto)
    REFERENCES categoriaProducto (idCategoriaProducto));


-- -----------------------------------------------------
-- ticketXproducto
-- -----------------------------------------------------
CREATE TABLE ticketXproducto (
  idTicketXproducto INT NOT NULL AUTO_INCREMENT,
  precioUnitario DECIMAL(6,2) NULL,
  cantidad TINYINT NULL,
  descuento DECIMAL(6,2) NULL,
  ticket_idTicket INT NOT NULL,
  producto_idProducto INT NOT NULL,
  PRIMARY KEY (idTicketXproducto),
    FOREIGN KEY (ticket_idTicket)
    REFERENCES ticket (idTicket),
    FOREIGN KEY (producto_idProducto)
    REFERENCES producto (idProducto));
    
    
-- -----------------------------------------------------
-- Empleados
-- -----------------------------------------------------   

INSERT INTO empleados (idEmpleados,nombre,telefono,direccion)
Values (null,"Fernando Cacerez", "11-23147888", "Calle falsa 123"),
(null,"Joaquin Perez", "11-23147888", "Av. Cordoba 3541"),
(null,"Maxi Lopez", "11-74857521", "Nazarre 3275"),
(null,"Anahi Mixid", "11-12457897", "Cuenca 885"),
(null,"Miriam Cacerez", "11-236258574", "Nogoya 66"),
(null,"Nicolas Ponce", "11-74528675", "Baigorria 258");

-- select * from empleados;


-- -----------------------------------------------------
-- Cliente
-- ----------------------------------------------------- 
INSERT INTO cliente (idCliente,nombre,telefono,dni,direccion,mail)
Values (null,"Elena Maria","11-78965478", "41895757", "Guardiola 456","bottimariaelena@hotmail.com"),
(null,"Romero Brenda","15-59567001", "41895757", "Av. Santa Fe 4815","brendagarrido95@gmail.com"),
(null,"Yanela Sinicco","15-33022514", "41895757", "Piedras 141","claudia_sinicco@yahoo.com.ar"),
(null,"Escudero Denise","15-34421881", "41895757", "Paso 551","denu_nenu@hotmail.com"),
(null,"Fucaraccio Salvador","15-50414213", "41895757", "Av. Cabildo 65","dieorlando@gmail.com"),
(null,"Giordano Romina","15-67571614", "41895757", "Azopardo 250","edariobenito@hotmail.com"),
(null,"Elena Zárate","11-32849243", "41895757", "Cordoba 547","go_diego_23@hotmail.com"),
(null,"Alejandra Graciela","15-52208817", "41895757", "Ituzaingo 412","gracielacalifa@gmail.com"),
(null,"Aimaro Nicolas","15-51648216", "41895757", "Matheu 456","infotecnotips@gmail.com"),
(null,"Terenzio Valenzuela","15-68679511", "41895757", "Cuenca 589","jebusjevus@hotmail.com"),
(null,"Toniutti Karina","11-34161313", "41895757", "Campana 258","karitambu@yahoo.com.ar"),
(null,"Uglessich Luciano","15-50993705", "41895757", "Nogoya 357","lcarpignano@gmail.com"),
(null,"Ferrari Marasco","15-54724002", "41895757", "Av. San Martin","leslymarasco@gmail.com");

-- select * from cliente;

-- -----------------------------------------------------
-- Ticket
-- -----------------------------------------------------

INSERT INTO ticket (idTicket,fechaFactura,empleados_idEmpleados,cliente_idCliente)
Values (null,"2021-10-12","1", "2"),
	(null,"2021-10-12","1", "1"),
	(null,"2021-10-12","5", "8"),
	(null,"2021-10-12","3", "5"),
	(null,"2021-10-12","4", "5"),
	(null,"2021-10-13","4", "1"),
	(null,"2021-10-13","4", "3"),
	(null,"2021-10-13","4", "11"),
    (null,"2021-10-13","2", "7"),
    (null,"2021-10-13","2", "6"),
    (null,"2021-10-13","2", "4"),
    (null,"2021-10-13","1", "2"),
	(null,"2021-10-13","1", "1");
    
-- select * from ticket;
-- -----------------------------------------------------
-- proveedor
-- -----------------------------------------------------
INSERT INTO proveedor (idProveedor,proveedorNombre,direccion,telefono)
Values ("100","Royal", "Congreso 547", "11-231457575"),
		("101","Purina", "San Martin 58585", "11-41410674"),
        ("102","DFV", "Martelli 456", "11-63771733"),
        ("103","Eukanuba", "Santo Tome 478", "11-43992735"),
        ("104","Puppies", "Chivilcoy 785", "11-61796305");
        
-- select * from proveedor;


-- -----------------------------------------------------
-- categoriaProducto
-- -----------------------------------------------------


INSERT INTO categoriaProducto (idCategoriaProducto,categoriaNombre,Descripcion)
Values (null,"Alimento","Alimento canino y felino"),
		(null,"Medicacion","Medicacion Gral"),
        (null,"Accesorio","Juguetes, golosinas y mas"),
        (null,"Vacuna","Vacunas disponibles"),
        (null,"Laboratorio","Estudios que realizamos"),
        (null,"Clinica","Clnica gral");
        
 
 -- select * from categoriaProducto;  


-- -----------------------------------------------------
-- producto
-- -----------------------------------------------------


INSERT INTO producto (idProducto,nombre,precioUnitario,stockActual,stockMinimo,proveedor_idProveedor,categoriaProducto_idCategoriaProducto)
Values ("1","Royal medium adulto 3kg", "3060","1","2","100","1"),
		("2","Royal medium adulto 15kg", "8040","5","2","100","1"),
        ("3","Royal maxi adulto 3kg", "2160","10","8","100","1"),
        ("4","Royal maxi adulto 15kg", "8150","5","9","100","1"),
        ("5","Royal medium puppy 3kg", "3110","1","6","100","1"),
        ("6","Royal medium puppy 15kg", "9160","7","2","100","1"),
        ("7","Royal maxi puppy 3kg", "4060","2","2","100","1"),
        ("8","Royal maxi puppy 15kg", "9230","1","3","100","1"),
        ("9","pipeta power 2-5kg", "606.20","3","1","102","2"),
        ("10","pipeta power 5-10kg", "668.86","6","5","102","2");
-- select * from producto;  






