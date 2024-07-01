-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_integrador2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_integrador2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_integrador2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema i1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema i1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `i1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_integrador2` ;

-- -----------------------------------------------------
-- Table `db_integrador2`.`armas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`armas` (
  `arma_id` INT NOT NULL AUTO_INCREMENT,
  `tipo_arma` VARCHAR(255) NULL DEFAULT NULL,
  `arma` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`arma_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`cantones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`cantones` (
  `canton_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_canton` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_canton` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`canton_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`circuitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`circuitos` (
  `circuito_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`circuito_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`lugares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`lugares` (
  `lugar_id` INT NOT NULL AUTO_INCREMENT,
  `lugar` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_lugar` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`lugar_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`personasgeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`personasgeneral` (
  `personas_general_id` INT NOT NULL AUTO_INCREMENT,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(255) NULL DEFAULT NULL,
  `estado_civil` VARCHAR(255) NULL DEFAULT NULL,
  `nivel_de_instruccion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`personas` (
  `persona_id` INT NOT NULL AUTO_INCREMENT,
  `edad` INT NULL DEFAULT NULL,
  `autoidentificacion_etnica` VARCHAR(100) NULL DEFAULT NULL,
  `estatus_migratorio` VARCHAR(100) NULL DEFAULT NULL,
  `genero` VARCHAR(50) NULL DEFAULT NULL,
  `condicion` VARCHAR(255) NULL DEFAULT NULL,
  `movilizacion` VARCHAR(255) NULL DEFAULT NULL,
  `personasGeneral_personas_general_id` INT NOT NULL,
  PRIMARY KEY (`persona_id`),
  INDEX `fk_personas_personasGeneral1_idx` (`personasGeneral_personas_general_id` ASC),
  CONSTRAINT `fk_personas_personasGeneral1`
    FOREIGN KEY (`personasGeneral_personas_general_id`)
    REFERENCES `db_integrador2`.`personasgeneral` (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`distritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`distritos` (
  `distrito_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_distrito` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`distrito_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`zonas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`zonas` (
  `zona_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_zona` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subzona` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`zona_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`ubi_forma2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`ubi_forma2` (
  `Ubi_forma2_id` INT NOT NULL AUTO_INCREMENT,
  `zonas_zona_id` INT NOT NULL,
  `circuitos_circuito_id` INT NOT NULL,
  `distritos_distrito_id` INT NOT NULL,
  PRIMARY KEY (`Ubi_forma2_id`),
  INDEX `fk_Ubi_forma2_zonas1_idx` (`zonas_zona_id` ASC),
  INDEX `fk_Ubi_forma2_circuitos1_idx` (`circuitos_circuito_id` ASC),
  INDEX `fk_Ubi_forma2_distritos1_idx` (`distritos_distrito_id` ASC),
  CONSTRAINT `fk_Ubi_forma2_circuitos1`
    FOREIGN KEY (`circuitos_circuito_id`)
    REFERENCES `db_integrador2`.`circuitos` (`circuito_id`),
  CONSTRAINT `fk_Ubi_forma2_distritos1`
    FOREIGN KEY (`distritos_distrito_id`)
    REFERENCES `db_integrador2`.`distritos` (`distrito_id`),
  CONSTRAINT `fk_Ubi_forma2_zonas1`
    FOREIGN KEY (`zonas_zona_id`)
    REFERENCES `db_integrador2`.`zonas` (`zona_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`parroquias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`parroquias` (
  `parroquia_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`parroquia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`provincincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`provincincias` (
  `provincia_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_provincia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`ubi_forma1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`ubi_forma1` (
  `Ubi_forma1_id` INT NOT NULL AUTO_INCREMENT,
  `cantones_canton_id` INT NOT NULL,
  `parroquias_parroquia_id` INT NOT NULL,
  `provincincias_provincia_id` INT NOT NULL,
  PRIMARY KEY (`Ubi_forma1_id`),
  INDEX `fk_ubi_forma1_cantones1_idx` (`cantones_canton_id` ASC),
  INDEX `fk_ubi_forma1_parroquias1_idx` (`parroquias_parroquia_id` ASC),
  INDEX `fk_ubi_forma1_provincincias1_idx` (`provincincias_provincia_id` ASC),
  CONSTRAINT `fk_ubi_forma1_cantones1`
    FOREIGN KEY (`cantones_canton_id`)
    REFERENCES `db_integrador2`.`cantones` (`canton_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ubi_forma1_parroquias1`
    FOREIGN KEY (`parroquias_parroquia_id`)
    REFERENCES `db_integrador2`.`parroquias` (`parroquia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ubi_forma1_provincincias1`
    FOREIGN KEY (`provincincias_provincia_id`)
    REFERENCES `db_integrador2`.`provincincias` (`provincia_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`fechahora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`fechahora` (
  `fechaHora_id` INT NOT NULL AUTO_INCREMENT,
  `fecha_detencion` DATE NULL DEFAULT NULL,
  `hora_detencion` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`fechaHora_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`detenciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`detenciones` (
  `detencion_id` INT NOT NULL AUTO_INCREMENT,
  `presunta_subinfraccion` VARCHAR(255) NULL DEFAULT NULL,
  `flagrante_boleta` VARCHAR(255) NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `numero_detenciones` INT NULL DEFAULT NULL,
  `presunta_infraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_flagrancia` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_modalidad` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_iccs` VARCHAR(255) NULL DEFAULT NULL,
  `armas_arma_id` INT NOT NULL,
  `Ubi_forma2_Ubi_forma2_id` INT NOT NULL,
  `personas_person_id` INT NOT NULL,
  `lugares_lugar_id` INT NOT NULL,
  `ubi_forma1_Ubi_forma1_id` INT NOT NULL,
  `fechahora_fechaHora_id` INT NOT NULL,
  PRIMARY KEY (`detencion_id`),
  INDEX `fk_detenciones_armas1_idx` (`armas_arma_id` ASC),
  INDEX `fk_detenciones_Ubi_forma21_idx` (`Ubi_forma2_Ubi_forma2_id` ASC),
  INDEX `fk_detenciones_personas1_idx` (`personas_person_id` ASC),
  INDEX `fk_detenciones_lugares1_idx` (`lugares_lugar_id` ASC),
  INDEX `fk_detenciones_ubi_forma11_idx` (`ubi_forma1_Ubi_forma1_id` ASC),
  INDEX `fk_detenciones_fechahora1_idx` (`fechahora_fechaHora_id` ASC),
  CONSTRAINT `fk_detenciones_armas1`
    FOREIGN KEY (`armas_arma_id`)
    REFERENCES `db_integrador2`.`armas` (`arma_id`),
  CONSTRAINT `fk_detenciones_lugares1`
    FOREIGN KEY (`lugares_lugar_id`)
    REFERENCES `db_integrador2`.`lugares` (`lugar_id`),
  CONSTRAINT `fk_detenciones_personas1`
    FOREIGN KEY (`personas_person_id`)
    REFERENCES `db_integrador2`.`personas` (`persona_id`),
  CONSTRAINT `fk_detenciones_Ubi_forma21`
    FOREIGN KEY (`Ubi_forma2_Ubi_forma2_id`)
    REFERENCES `db_integrador2`.`ubi_forma2` (`Ubi_forma2_id`),
  CONSTRAINT `fk_detenciones_ubi_forma11`
    FOREIGN KEY (`ubi_forma1_Ubi_forma1_id`)
    REFERENCES `db_integrador2`.`ubi_forma1` (`Ubi_forma1_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detenciones_fechahora1`
    FOREIGN KEY (`fechahora_fechaHora_id`)
    REFERENCES `db_integrador2`.`fechahora` (`fechaHora_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`detenidos1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`detenidos1` (
  `detenidos1_id` INT NOT NULL AUTO_INCREMENT,
  `zona` VARCHAR(255) NULL DEFAULT NULL,
  `subzona` VARCHAR(255) NULL DEFAULT NULL,
  `canton` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_detencion` DATE NULL DEFAULT NULL,
  `hora_detencion` VARCHAR(8) NULL DEFAULT NULL,
  `flagrante_boleta` VARCHAR(255) NULL DEFAULT NULL,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `edad` DECIMAL(10,0) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(255) NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `autoidentificacion_etnica` VARCHAR(255) NULL DEFAULT NULL,
  `numero_detenciones` INT NULL DEFAULT NULL,
  `nombre_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `lugar` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_subinfraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_infraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_flagrancia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_iccs` VARCHAR(255) NULL DEFAULT NULL,
  `estado_civil` VARCHAR(255) NULL DEFAULT NULL,
  `estatus_migratorio` VARCHAR(255) NULL DEFAULT NULL,
  `genero` VARCHAR(50) NULL DEFAULT NULL,
  `nivel_de_instruccion` VARCHAR(255) NULL DEFAULT NULL,
  `condicion` VARCHAR(255) NULL DEFAULT NULL,
  `movilizacion` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_arma` VARCHAR(255) NULL DEFAULT NULL,
  `arma` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_lugar` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_canton` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_modalidad` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`detenidos1_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_integrador2`.`victimasdemuerte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_integrador2`.`victimasdemuerte` (
  `victimas_muerte_id` INT NOT NULL AUTO_INCREMENT,
  `area_Hecho` VARCHAR(45) NULL DEFAULT NULL,
  `causa_muerte` VARCHAR(45) NULL DEFAULT NULL,
  `presunta_motivacion` VARCHAR(45) NULL DEFAULT NULL,
  `lugar` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_infraccion` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_muerte` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_arma` VARCHAR(45) NULL DEFAULT NULL,
  `zonas_zona_id` INT NOT NULL,
  `personasGeneral_personas_general_id` INT NOT NULL,
  PRIMARY KEY (`victimas_muerte_id`),
  INDEX `fk_victimas_de_muerte_zonas1_idx` (`zonas_zona_id` ASC),
  INDEX `fk_victimasDeMuerte_personasGeneral1_idx` (`personasGeneral_personas_general_id` ASC),
  CONSTRAINT `fk_victimas_de_muerte_zonas1`
    FOREIGN KEY (`zonas_zona_id`)
    REFERENCES `db_integrador2`.`zonas` (`zona_id`),
  CONSTRAINT `fk_victimasDeMuerte_personasGeneral1`
    FOREIGN KEY (`personasGeneral_personas_general_id`)
    REFERENCES `db_integrador2`.`personasgeneral` (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `i1` ;

-- -----------------------------------------------------
-- Table `i1`.`armas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`armas` (
  `arma_id` INT NOT NULL AUTO_INCREMENT,
  `tipo_arma` VARCHAR(255) NULL DEFAULT NULL,
  `arma` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`arma_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`cantones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`cantones` (
  `canton_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_canton` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_canton` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`canton_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`circuitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`circuitos` (
  `circuito_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`circuito_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`fechahora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`fechahora` (
  `fechaHora_id` INT NOT NULL AUTO_INCREMENT,
  `fecha_detencion` DATE NULL DEFAULT NULL,
  `hora_detencion` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`fechaHora_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`lugares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`lugares` (
  `lugar_id` INT NOT NULL AUTO_INCREMENT,
  `lugar` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_lugar` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`lugar_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`personasgeneral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`personasgeneral` (
  `personas_general_id` INT NOT NULL AUTO_INCREMENT,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(255) NULL DEFAULT NULL,
  `estado_civil` VARCHAR(255) NULL DEFAULT NULL,
  `nivel_de_instruccion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`personas` (
  `persona_id` INT NOT NULL AUTO_INCREMENT,
  `edad` INT NULL DEFAULT NULL,
  `autoidentificacion_etnica` VARCHAR(100) NULL DEFAULT NULL,
  `estatus_migratorio` VARCHAR(100) NULL DEFAULT NULL,
  `genero` VARCHAR(50) NULL DEFAULT NULL,
  `condicion` VARCHAR(255) NULL DEFAULT NULL,
  `movilizacion` VARCHAR(255) NULL DEFAULT NULL,
  `personasGeneral_personas_general_id` INT NOT NULL,
  PRIMARY KEY (`persona_id`),
  INDEX `fk_personas_personasGeneral1_idx` (`personasGeneral_personas_general_id` ASC),
  CONSTRAINT `fk_personas_personasGeneral1`
    FOREIGN KEY (`personasGeneral_personas_general_id`)
    REFERENCES `i1`.`personasgeneral` (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`parroquias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`parroquias` (
  `parroquia_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`parroquia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`provincincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`provincincias` (
  `provincia_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_provincia` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`provincia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`ubi_forma1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`ubi_forma1` (
  `Ubi_forma1_id` INT NOT NULL AUTO_INCREMENT,
  `cantones_canton_id` INT NOT NULL,
  `parroquias_parroquia_id` INT NOT NULL,
  `provincincias_provincia_id` INT NOT NULL,
  PRIMARY KEY (`Ubi_forma1_id`),
  INDEX `fk_ubi_forma1_cantones1_idx` (`cantones_canton_id` ASC),
  INDEX `fk_ubi_forma1_parroquias1_idx` (`parroquias_parroquia_id` ASC),
  INDEX `fk_ubi_forma1_provincincias1_idx` (`provincincias_provincia_id` ASC),
  CONSTRAINT `fk_ubi_forma1_cantones1`
    FOREIGN KEY (`cantones_canton_id`)
    REFERENCES `i1`.`cantones` (`canton_id`),
  CONSTRAINT `fk_ubi_forma1_parroquias1`
    FOREIGN KEY (`parroquias_parroquia_id`)
    REFERENCES `i1`.`parroquias` (`parroquia_id`),
  CONSTRAINT `fk_ubi_forma1_provincincias1`
    FOREIGN KEY (`provincincias_provincia_id`)
    REFERENCES `i1`.`provincincias` (`provincia_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`distritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`distritos` (
  `distrito_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_distrito` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`distrito_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`zonas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`zonas` (
  `zona_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_zona` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subzona` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`zona_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`ubi_forma2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`ubi_forma2` (
  `Ubi_forma2_id` INT NOT NULL AUTO_INCREMENT,
  `zonas_zona_id` INT NOT NULL,
  `circuitos_circuito_id` INT NOT NULL,
  `distritos_distrito_id` INT NOT NULL,
  PRIMARY KEY (`Ubi_forma2_id`),
  INDEX `fk_Ubi_forma2_zonas1_idx` (`zonas_zona_id` ASC),
  INDEX `fk_Ubi_forma2_circuitos1_idx` (`circuitos_circuito_id` ASC),
  INDEX `fk_Ubi_forma2_distritos1_idx` (`distritos_distrito_id` ASC),
  CONSTRAINT `fk_Ubi_forma2_circuitos1`
    FOREIGN KEY (`circuitos_circuito_id`)
    REFERENCES `i1`.`circuitos` (`circuito_id`),
  CONSTRAINT `fk_Ubi_forma2_distritos1`
    FOREIGN KEY (`distritos_distrito_id`)
    REFERENCES `i1`.`distritos` (`distrito_id`),
  CONSTRAINT `fk_Ubi_forma2_zonas1`
    FOREIGN KEY (`zonas_zona_id`)
    REFERENCES `i1`.`zonas` (`zona_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`detenciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`detenciones` (
  `detencion_id` INT NOT NULL AUTO_INCREMENT,
  `presunta_subinfraccion` VARCHAR(255) NULL DEFAULT NULL,
  `flagrante_boleta` VARCHAR(255) NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `numero_detenciones` INT NULL DEFAULT NULL,
  `presunta_infraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_flagrancia` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_modalidad` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_iccs` VARCHAR(255) NULL DEFAULT NULL,
  `armas_arma_id` INT NOT NULL,
  `Ubi_forma2_Ubi_forma2_id` INT NOT NULL,
  `personas_person_id` INT NOT NULL,
  `lugares_lugar_id` INT NOT NULL,
  `ubi_forma1_Ubi_forma1_id` INT NOT NULL,
  `fechahora_fechaHora_id` INT NOT NULL,
  PRIMARY KEY (`detencion_id`),
  INDEX `fk_detenciones_armas1_idx` (`armas_arma_id` ASC),
  INDEX `fk_detenciones_Ubi_forma21_idx` (`Ubi_forma2_Ubi_forma2_id` ASC),
  INDEX `fk_detenciones_personas1_idx` (`personas_person_id` ASC),
  INDEX `fk_detenciones_lugares1_idx` (`lugares_lugar_id` ASC),
  INDEX `fk_detenciones_ubi_forma11_idx` (`ubi_forma1_Ubi_forma1_id` ASC),
  INDEX `fk_detenciones_fechahora1_idx` (`fechahora_fechaHora_id` ASC),
  CONSTRAINT `fk_detenciones_armas1`
    FOREIGN KEY (`armas_arma_id`)
    REFERENCES `i1`.`armas` (`arma_id`),
  CONSTRAINT `fk_detenciones_fechahora1`
    FOREIGN KEY (`fechahora_fechaHora_id`)
    REFERENCES `i1`.`fechahora` (`fechaHora_id`),
  CONSTRAINT `fk_detenciones_lugares1`
    FOREIGN KEY (`lugares_lugar_id`)
    REFERENCES `i1`.`lugares` (`lugar_id`),
  CONSTRAINT `fk_detenciones_personas1`
    FOREIGN KEY (`personas_person_id`)
    REFERENCES `i1`.`personas` (`persona_id`),
  CONSTRAINT `fk_detenciones_ubi_forma11`
    FOREIGN KEY (`ubi_forma1_Ubi_forma1_id`)
    REFERENCES `i1`.`ubi_forma1` (`Ubi_forma1_id`),
  CONSTRAINT `fk_detenciones_Ubi_forma21`
    FOREIGN KEY (`Ubi_forma2_Ubi_forma2_id`)
    REFERENCES `i1`.`ubi_forma2` (`Ubi_forma2_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`detenidos1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`detenidos1` (
  `detenidos1_id` INT NOT NULL AUTO_INCREMENT,
  `zona` VARCHAR(255) NULL DEFAULT NULL,
  `subzona` VARCHAR(255) NULL DEFAULT NULL,
  `canton` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_detencion` DATE NULL DEFAULT NULL,
  `hora_detencion` VARCHAR(8) NULL DEFAULT NULL,
  `flagrante_boleta` VARCHAR(255) NULL DEFAULT NULL,
  `sexo` VARCHAR(50) NULL DEFAULT NULL,
  `edad` DECIMAL(10,0) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(255) NULL DEFAULT NULL,
  `tipo` VARCHAR(255) NULL DEFAULT NULL,
  `autoidentificacion_etnica` VARCHAR(255) NULL DEFAULT NULL,
  `numero_detenciones` INT NULL DEFAULT NULL,
  `nombre_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_distrito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_circuito` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_subcircuito` VARCHAR(255) NULL DEFAULT NULL,
  `lugar` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_subinfraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_infraccion` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_flagrancia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_iccs` VARCHAR(255) NULL DEFAULT NULL,
  `estado_civil` VARCHAR(255) NULL DEFAULT NULL,
  `estatus_migratorio` VARCHAR(255) NULL DEFAULT NULL,
  `genero` VARCHAR(50) NULL DEFAULT NULL,
  `nivel_de_instruccion` VARCHAR(255) NULL DEFAULT NULL,
  `condicion` VARCHAR(255) NULL DEFAULT NULL,
  `movilizacion` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_arma` VARCHAR(255) NULL DEFAULT NULL,
  `arma` VARCHAR(255) NULL DEFAULT NULL,
  `tipo_lugar` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_provincia` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_canton` VARCHAR(255) NULL DEFAULT NULL,
  `codigo_parroquia` VARCHAR(255) NULL DEFAULT NULL,
  `presunta_modalidad` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`detenidos1_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `i1`.`victimasdemuerte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `i1`.`victimasdemuerte` (
  `victimas_muerte_id` INT NOT NULL AUTO_INCREMENT,
  `area_Hecho` VARCHAR(45) NULL DEFAULT NULL,
  `causa_muerte` VARCHAR(45) NULL DEFAULT NULL,
  `presunta_motivacion` VARCHAR(45) NULL DEFAULT NULL,
  `lugar` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_infraccion` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_muerte` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_arma` VARCHAR(45) NULL DEFAULT NULL,
  `zonas_zona_id` INT NOT NULL,
  `personasGeneral_personas_general_id` INT NOT NULL,
  PRIMARY KEY (`victimas_muerte_id`),
  INDEX `fk_victimas_de_muerte_zonas1_idx` (`zonas_zona_id` ASC),
  INDEX `fk_victimasDeMuerte_personasGeneral1_idx` (`personasGeneral_personas_general_id` ASC),
  CONSTRAINT `fk_victimas_de_muerte_zonas1`
    FOREIGN KEY (`zonas_zona_id`)
    REFERENCES `i1`.`zonas` (`zona_id`),
  CONSTRAINT `fk_victimasDeMuerte_personasGeneral1`
    FOREIGN KEY (`personasGeneral_personas_general_id`)
    REFERENCES `i1`.`personasgeneral` (`personas_general_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
