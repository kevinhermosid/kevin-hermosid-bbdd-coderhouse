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
    REFERENCES producto (idProducto))