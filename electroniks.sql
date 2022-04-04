-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: electroniks
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0ubuntu0.21.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Carrito_compras`
--

DROP TABLE IF EXISTS `Carrito_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carrito_compras` (
  `id_carrito_compras` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_modelo` int(50) NOT NULL,
  `cantidad` int(50) NOT NULL,
  `id_color` int(11) NOT NULL,
  PRIMARY KEY (`id_carrito_compras`),
  KEY `Carrito_compras_Modelos_id_modelo_fk` (`id_modelo`),
  CONSTRAINT `Carrito_compras_Modelos_id_modelo_fk` FOREIGN KEY (`id_modelo`) REFERENCES `Modelos` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrito_compras`
--

LOCK TABLES `Carrito_compras` WRITE;
/*!40000 ALTER TABLE `Carrito_compras` DISABLE KEYS */;
INSERT INTO `Carrito_compras` (`id_carrito_compras`, `id_usuario`, `id_modelo`, `cantidad`, `id_color`) VALUES (9,9,29,25,7),(10,9,29,25,7),(23,16,29,100,10),(24,16,29,100,10),(27,16,29,100,10),(28,16,29,50,10),(30,6,29,50,10),(31,6,29,50,5);
/*!40000 ALTER TABLE `Carrito_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` (`id_categoria`, `categoria`) VALUES (2,'Gamer'),(3,'Basica'),(4,'Ultralivianas'),(5,'2-1'),(6,'Touchscreen');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Color`
--

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;
INSERT INTO `Color` (`id_color`, `color`) VALUES (1,'Negro'),(2,'Morado'),(4,'Azul'),(5,'Silver'),(7,'Blanco'),(8,'Rosa'),(9,'Rosa'),(10,'Azul'),(11,'Morado'),(12,'Blanco');
/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `Direccion_id_usuario_fk` (`id_usuario`),
  CONSTRAINT `Direccion_id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
INSERT INTO `Direccion` (`id_direccion`, `direccion`, `id_usuario`) VALUES (12,'Azalea_20_chalco_edomex_45783',2),(14,'Paseo_Las_Rosas_18_GDL_45754',12),(15,'San_Antonio23_Hda_San_Agustin_45342',16),(17,'Azaleas_67_CDMX_89526',4),(18,'Isla_Barvolento_45_CDMX_25363',10),(19,'Fondo_De_Bikini_56_Marecito_67576',9),(20,'Rinconada_Cangrejo_34_GDL_45245',11),(21,'Paseo_Coatis_70_Michoacan_37473',13),(22,'Jardines_Guadalupe_03_Pachuca_37473',13),(23,'Lago_Guanacacha_63_Pachuca_85685',4),(24,'Howarts_01_USA_78284',17),(25,'Oblatos_67_Zapopan_10210',18),(26,'Beverly_Hills_08_LA_12512',19),(27,'Mazapan_35_Tijuana_25321',20),(28,'Hacienda_Tigre_29_Sonora_13846',21),(29,'Rincon_Feliz_08_Guatemala',22),(30,'Sillicon_Valley_32_San_Francisco_19829',24),(31,'Aldama_11_Jalisco_45323',25),(32,'Villareal_82_Baja_California_12134',26),(33,'Tesistan_64_Guadalajara_34534',27);
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Imagenes`
--

DROP TABLE IF EXISTS `Imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagenes` (
  `id_imagenes` int(11) NOT NULL AUTO_INCREMENT,
  `imagenes` varchar(100) NOT NULL,
  `id_modelo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_imagenes`),
  KEY `Imagenes_Modelos_id_modelo_fk` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagenes`
--

LOCK TABLES `Imagenes` WRITE;
/*!40000 ALTER TABLE `Imagenes` DISABLE KEYS */;
INSERT INTO `Imagenes` (`id_imagenes`, `imagenes`, `id_modelo`) VALUES (16,'MacMini_1.jpg','2'),(17,'MacMini_1.jpg','2'),(18,'MacMini_1.jpg','2'),(19,'MacMini_1.jpg','2'),(20,'MacMini_2.jpg','3'),(21,'MacMini_1.jpg','2'),(22,'MacMini_2.jpg','3'),(23,'MacMini_1.jpg','2'),(24,'MacMini_2.jpg','3'),(25,'Hp.jpg','4'),(26,'AcerAspire.jpg','5'),(27,'LaptopYoga.jpg','6'),(28,'LaptopAsusVivo.jpg','45'),(29,'LaptopLenovo.jpg','47'),(30,'LaptopHP14.jpg','51'),(31,'LaptopLenovoIdeapad.jpg','53');
/*!40000 ALTER TABLE `Imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) DEFAULT NULL,
  `clave_marca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` (`id_marca`, `marca`, `clave_marca`) VALUES (1,'Acer','1'),(2,'Macbook','Macbook_pro'),(3,'Macbook','Macbook_pro'),(4,'Macbook','Macbook_pro'),(5,'Asus','Asus_vivo'),(6,'LapYoga','Yoga'),(7,'AcerAspire','Aspire'),(8,'Lenovo','LenovoS145'),(9,'AsusVivobook','LapAsus'),(10,'HP','LapHP14'),(11,'Lenovo','LenovoIdeapad');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Metodo_pago`
--

DROP TABLE IF EXISTS `Metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Metodo_pago` (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `pago` varchar(100) DEFAULT NULL,
  `nombre_titular` varchar(100) DEFAULT NULL,
  `numero_de_tarjeta` varchar(50) NOT NULL,
  `fecha_de_vencimiento` varchar(5) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`),
  CONSTRAINT `Metodo_pago_id_metodo_pago_fk` FOREIGN KEY (`id_metodo_pago`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metodo_pago`
--

LOCK TABLES `Metodo_pago` WRITE;
/*!40000 ALTER TABLE `Metodo_pago` DISABLE KEYS */;
INSERT INTO `Metodo_pago` (`id_metodo_pago`, `pago`, `nombre_titular`, `numero_de_tarjeta`, `fecha_de_vencimiento`, `id_usuario`) VALUES (2,'t_credito','Maria_Lopez','189775194128126','0224',9),(13,'t_debito','Gabs','54421184312','0826',19),(14,'t_credito','Maria_Lopez','189775194128126','0224',9),(15,'t_debito','Gabs','54421184312','0826',19),(16,'t_credito','Pedro_Covarrubias','158984322184641','0627',25),(17,'t_debito','Barry_Allen','167521863147465','0628',29),(18,'t_credito','Alfredo_Samano','5197236325356','0927',31),(19,'t_debito','Jovanni_Perez','71528692174548','0123',17),(20,'t_debito','Santiago','715876904852657','0429',14),(21,'t_credito','Ines_Villasenor','477516386187962','0326',24),(22,'t_credito','Mercedes_Cohen','876228426976135','0824',28);
/*!40000 ALTER TABLE `Metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelo_color`
--

DROP TABLE IF EXISTS `Modelo_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modelo_color` (
  `id_modelo_color` int(11) NOT NULL AUTO_INCREMENT,
  `id_modelo` varchar(100) DEFAULT NULL,
  `id_color` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_modelo_color`),
  CONSTRAINT `Modelo_color_Color_id_color_fk` FOREIGN KEY (`id_modelo_color`) REFERENCES `Color` (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelo_color`
--

LOCK TABLES `Modelo_color` WRITE;
/*!40000 ALTER TABLE `Modelo_color` DISABLE KEYS */;
INSERT INTO `Modelo_color` (`id_modelo_color`, `id_modelo`, `id_color`) VALUES (8,'2','4'),(9,'32A5BE','8'),(10,'73E82','10'),(11,'LE4W82','4'),(12,'22B03LA','5');
/*!40000 ALTER TABLE `Modelo_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modelos`
--

DROP TABLE IF EXISTS `Modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modelos` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `existencia_cantidad` int(2) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  UNIQUE KEY `Models_modelo_uindex` (`modelo`),
  KEY `Modelos_Categoria_id_categoria_fk` (`id_categoria`),
  KEY `Modelos_Marca_id_marca_fk` (`id_marca`),
  CONSTRAINT `Modelos_Categoria_id_categoria_fk` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`),
  CONSTRAINT `Modelos_Marca_id_marca_fk` FOREIGN KEY (`id_marca`) REFERENCES `Marca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modelos`
--

LOCK TABLES `Modelos` WRITE;
/*!40000 ALTER TABLE `Modelos` DISABLE KEYS */;
INSERT INTO `Modelos` (`id_modelo`, `modelo`, `id_marca`, `existencia_cantidad`, `precio`, `id_categoria`, `descripcion`) VALUES (29,'22B03LA',2,15,'8999',2,'Laptop_Hp_22B03LA.txt'),(35,'32A5BE',3,10,'5999',5,'LaptopAcerAspire.txt'),(44,'73E82',6,5,'4999',6,'LaptopYoga.txt'),(45,'74E82',2,50,'6999',4,'LaptopAsusVivo.txt	'),(47,'74W82',4,10,'9299',3,'LaptopLenovoS145-14AST.txt'),(50,'94W82',4,60,'9999',2,'LaptopAsusVivobookX413Ja.txt'),(51,'HP4W82',5,15,'9999',2,'LaptopHP14-cf2033.txt'),(53,'LE4W82',2,7,'5999',3,'LaptopLenovoIdeapad.txt');
/*!40000 ALTER TABLE `Modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefonos`
--

DROP TABLE IF EXISTS `Telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefonos` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `Telefonos_id_usuario_fk` (`id_usuario`),
  CONSTRAINT `Telefonos_Usuarios_id_usuario_fk` FOREIGN KEY (`id_telefono`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefonos`
--

LOCK TABLES `Telefonos` WRITE;
/*!40000 ALTER TABLE `Telefonos` DISABLE KEYS */;
INSERT INTO `Telefonos` (`id_telefono`, `telefono`, `id_usuario`) VALUES (9,'66421973',2),(10,'1675491168',20),(11,'819247743256',8),(12,'7675391168',10),(13,'331064587',5),(14,'7697391168',7),(15,'331344587',3),(16,'33784619',22),(17,'52176498',6),(18,'13467852',4);
/*!40000 ALTER TABLE `Telefonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `foto_de_perfil` varchar(50) NOT NULL,
  `miembro_plus` varchar(100) NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` (`id_usuario`, `usuario`, `nombre_completo`, `foto_de_perfil`, `miembro_plus`, `correo_electronico`, `password`) VALUES (2,'santi123','Santiago','Santiago.jpg','Si','santiaguito@gmail.com','ajuajua'),(4,'aaaaa','Gabs','Gabs.jpg','Si','cac@gmail.com','totoposynutella'),(9,'maria23','Maria_Lopez','Maria.jpg','No','maria@outlook.com','micontra08'),(10,'santi123','Santiago','Santiago.jpg','Si','santiaguito@gmail.com','ajuajua'),(11,'santi123','Santiago','Santiago.jpg','Si','santiaguito@gmail.com','ajuajua'),(12,'aaaaa','Gabs','Gabs.jpg','Si','cac@gmail.com','totoposynutella'),(13,'maria23','Maria_Lopez','Maria.jpg','No','maria@outlook.com','micontra08'),(14,'santi123','Santiago','Santiago.jpg','Si','santiaguito@gmail.com','12345678910'),(15,'aaaaa','Gabs','Gabs.jpg','Si','cac@gmail.com','muchospandas'),(16,'maria23','Maria_Lopez','Maria.jpg','No','maria@outlook.com','elotesasados2'),(17,'jo454','Jovanni_Perez','Jovanni.jpg','Si','Jovanni10@yahoo.com','12345'),(18,'santi123','Santiago','Santiago.jpg','Si','santiaguito@gmail.com','universo20'),(19,'aaaaa','Gabs','Gabs.jpg','Si','cac@gmail.com','comida12'),(20,'maria23','Maria_Lopez','Maria.jpg','No','maria@outlook.com','arrozconleshe'),(21,'jo454','Jovanni_Perez','Jovanni.jpg','Si','Jovanni10@yahoo.com','canciones09'),(22,'Feerjd','Fernanda_Jimenez','Fernanda.jpg','Si','Fernandajim@gmail.com','totopos12'),(24,'Ines_Villasa','Ines_Villasenor','Ines.jpg','Si','Villasenor.ines@gmail.com','Patofeliz'),(25,'Covaramos','Pedro_Covarrubias','Pedro.jpg','No','pcovarruvias98@gmail.com','Tengodospandas78'),(26,'Dewey14','Donato_Guerra','Dewey.jpg','No','dguerramtz92@hotmail.com','quesadillafrita'),(27,'Josemdc','Jose_Carlos_Del_Campo','JoseCarlos.jpg','Si','joseg_mdc@gmail.com','cocacolafria2'),(28,'me_cohen','Mercedes_Cohen','Mercedes.jpg','Si','mercedes.cg97@gmail.com','avecesgomito4'),(29,'B.Allen','Barry_Allen','Barry_Allen.jpg','No','ba.ortega@hotmail','payDequeso'),(30,'Jordet','Jordi_Puig','Panda.jpg','No','jordipuigg92@gmail.com','ositoscarinositos'),(31,'Samano52','Alfredo_Samano','Alf.jpg','Si','Alficool@yahoo.com','vicoldplayenig'),(60,'PedritoSola88','Pedro_Sola','PedritoSola.jpg','AD','macormick@gmail.com','Mayonesahelmans');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 15:27:40
