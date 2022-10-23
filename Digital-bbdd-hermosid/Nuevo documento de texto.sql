CREATE SCHEMA IF NOT EXISTS `bbddVet` DEFAULT CHARACTER SET utf8 ;
USE `bbddVet` ;

-- -----------------------------------------------------
-- empleados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`empleados` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NULL,
  `telefono` VARCHAR(20) NULL,
  `direccion` VARCHAR(40) NULL,
  PRIMARY KEY (`idEmpleados`));


-- -----------------------------------------------------
-- cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NULL,
  `telefono` VARCHAR(20) NULL,
  `dni` INT NULL,
  `direccion` VARCHAR(40) NULL,
  `mail` VARCHAR(70) NULL,
  PRIMARY KEY (`idCliente`));


-- -----------------------------------------------------
-- ticket
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`ticket` (
  `idTicket` INT NOT NULL AUTO_INCREMENT,
  `fechaFactura` DATETIME NULL,
  `empleados_idEmpleados` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `fk_ticket_empleados_idx` (`empleados_idEmpleados` ASC) VISIBLE,
  INDEX `fk_ticket_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_empleados`
    FOREIGN KEY (`empleados_idEmpleados`)
    REFERENCES `bbddVet`.`empleados` (`idEmpleados`),
  CONSTRAINT `fk_ticket_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `bbddVet`.`cliente` (`idCliente`));


-- -----------------------------------------------------
-- proveedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`proveedor` (
  `idProveedor` INT NOT NULL,
  `proveedorNombre` VARCHAR(40) NULL,
  `direccion` VARCHAR(40) NULL,
  `telefono` VARCHAR(20) NULL,
  PRIMARY KEY (`idProveedor`));


-- -----------------------------------------------------
-- categoriaProducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`categoriaProducto` (
  `idCategoriaProducto` INT NOT NULL AUTO_INCREMENT,
  `categoriaNombre` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(500) NULL,
  PRIMARY KEY (`idCategoriaProducto`));


-- -----------------------------------------------------
-- producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`producto` (
  `idProducto` INT NOT NULL,
  `nombre` VARCHAR(40) NULL,
  `precioUnitario` DECIMAL(6,2) NULL,
  `stockActual` INT NULL,
  `stockMinimo` INT NULL,
  `proveedor_idProveedor` INT NOT NULL,
  `categoriaProducto_idCategoriaProducto` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_producto_proveedor1_idx` (`proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_producto_categoriaProducto1_idx` (`categoriaProducto_idCategoriaProducto` ASC) VISIBLE,
  CONSTRAINT `fk_producto_proveedor1`
    FOREIGN KEY (`proveedor_idProveedor`)
    REFERENCES `bbddVet`.`proveedor` (`idProveedor`),
  CONSTRAINT `fk_producto_categoriaProducto1`
    FOREIGN KEY (`categoriaProducto_idCategoriaProducto`)
    REFERENCES `bbddVet`.`categoriaProducto` (`idCategoriaProducto`));


-- -----------------------------------------------------
-- ticketXproducto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bbddVet`.`ticketXproducto` (
  `idTicketXproducto` INT NOT NULL AUTO_INCREMENT,
  `precioUnitario` DECIMAL(6,2) NULL,
  `cantidad` TINYINT NULL,
  `descuento` DECIMAL(6,2) NULL,
  `ticket_idTicket` INT NOT NULL,
  `producto_idProducto` INT NOT NULL,
  PRIMARY KEY (`idTicketXproducto`),
  INDEX `fk_ticketXproducto_ticket1_idx` (`ticket_idTicket` ASC) VISIBLE,
  INDEX `fk_ticketXproducto_producto1_idx` (`producto_idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_ticketXproducto_ticket1`
    FOREIGN KEY (`ticket_idTicket`)
    REFERENCES `bbddVet`.`ticket` (`idTicket`),
  CONSTRAINT `fk_ticketXproducto_producto1`
    FOREIGN KEY (`producto_idProducto`)
    REFERENCES `bbddVet`.`producto` (`idProducto`))