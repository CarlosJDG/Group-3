CREATE SCHEMA IF NOT EXISTS Tabla1 ;
USE Tabla1 ;
-- -----------------------------------------------------
-- Table Tabla1.Automovil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Automovil (
matricula VARCHAR(6) NOT NULL,
marca VARCHAR(50) NOT NULL,
color VARCHAR(45) NOT NULL,
modelo VARCHAR(45) NOT NULL,
PRIMARY KEY (matricula))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Cliente (
idCliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INT NOT NULL,
Automovil_matricula VARCHAR(6) NOT NULL,
PRIMARY KEY (idCliente),
INDEX fk_Cliente_Automovil_idx (Automovil_matricula ASC) VISIBLE,
CONSTRAINT fk_Cliente_Automovil
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.Mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Mecanico (
idMecanico INT NOT NULL,
matricula VARCHAR(6) NOT NULL,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
fechaContratacion DATE NOT NULL,
salario INT NOT NULL,
PRIMARY KEY (idMecanico))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.Reparacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Reparacion (
idReparacion INT NOT NULL,
matricula VARCHAR(6) NULL,
fecha DATE NULL,
tiempo VARCHAR(45) NULL,
PRIMARY KEY (idReparacion))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.Automovil_has_Reparacion
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Automovil_has_Reparacion (
Automovil_matricula VARCHAR(6) NOT NULL,
Reparacion_idReparacion INT NOT NULL,
PRIMARY KEY (Automovil_matricula, Reparacion_idReparacion),
INDEX fk_Automovil_has_Reparacion_Reparacion1_idx (Reparacion_idReparacion ASC) VISIBLE,
INDEX fk_Automovil_has_Reparacion_Automovil1_idx (Automovil_matricula ASC) VISIBLE,
CONSTRAINT fk_Automovil_has_Reparacion_Automovil1
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_Automovil_has_Reparacion_Reparacion1
FOREIGN KEY (Reparacion_idReparacion)
REFERENCES Tabla1.Reparacion (idReparacion)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.Automovil_has_Mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.Automovil_has_Mecanico (
Automovil_matricula VARCHAR(6) NOT NULL,
Mecanico_idMecanico INT NOT NULL,
PRIMARY KEY (Automovil_matricula, Mecanico_idMecanico),
INDEX fk_Automovil_has_Mecanico_Mecanico1_idx (Mecanico_idMecanico ASC) VISIBLE,
INDEX fk_Automovil_has_Mecanico_Automovil1_idx (Automovil_matricula ASC) VISIBLE,
CONSTRAINT fk_Automovil_has_Mecanico_Automovil1
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_Automovil_has_Mecanico_Mecanico1
FOREIGN KEY (Mecanico_idMecanico)
REFERENCES Tabla1.Mecanico (idMecanico)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.FichaCompra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.FichaCompra (
idFichaCompra INT NOT NULL AUTO_INCREMENT,
FechaCompra DATE NOT NULL,
Precio INT NOT NULL,
Automovil_matricula VARCHAR(6) NOT NULL,
Cliente_idCliente INT NOT NULL,
PRIMARY KEY (idFichaCompra),
INDEX fk_FichaCompra_Automovil1_idx (Automovil_matricula ASC) VISIBLE,
INDEX fk_FichaCompra_Cliente1_idx (Cliente_idCliente ASC) VISIBLE,
CONSTRAINT fk_FichaCompra_Automovil1
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_FichaCompra_Cliente1
FOREIGN KEY (Cliente_idCliente)
REFERENCES Tabla1.Cliente (idCliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.AutoNuevo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.AutoNuevo (
idAutoNuevo INT NOT NULL AUTO_INCREMENT,
Cantidad INT NOT NULL,
Automovil_matricula VARCHAR(6) NOT NULL,
PRIMARY KEY (idAutoNuevo),
INDEX fk_AutoNuevo_Automovil1_idx (Automovil_matricula ASC) VISIBLE,
CONSTRAINT fk_AutoNuevo_Automovil1
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table Tabla1.AutoViejo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tabla1.AutoViejo (
idDetalle INT NOT NULL AUTO_INCREMENT,
Kilometraje DECIMAL(10,2) NOT NULL,
Automovil_matricula VARCHAR(6) NOT NULL,
PRIMARY KEY (idDetalle),
INDEX fk_AutoViejo_Automovil1_idx (Automovil_matricula ASC) VISIBLE,
CONSTRAINT fk_AutoViejo_Automovil1
FOREIGN KEY (Automovil_matricula)
REFERENCES Tabla1.Automovil (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;