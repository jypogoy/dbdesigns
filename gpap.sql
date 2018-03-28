-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 10.120.20.206    Database: gpap
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `Id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `activityTaskId` tinyint(3) unsigned NOT NULL,
  `userId` varchar(25) NOT NULL,
  `activityStartTime` datetime NOT NULL DEFAULT current_timestamp(),
  `activityEndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`,`activityTaskId`,`userId`),
  KEY `fk_activity_task1_idx` (`activityTaskId`),
  KEY `fk_activity_user1_idx` (`userId`),
  CONSTRAINT `fk_activity_task1` FOREIGN KEY (`activityTaskId`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_user1` FOREIGN KEY (`userId`) REFERENCES `user1` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `zip_id` bigint(11) unsigned NOT NULL,
  `trans_type_id` tinyint(3) unsigned NOT NULL,
  `is_completed` bit(1) DEFAULT b'0',
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`,`zip_id`,`trans_type_id`),
  KEY `fk_order_batch1_idx` (`zip_id`),
  KEY `fk_order_trans_type1_idx` (`trans_type_id`),
  CONSTRAINT `fk_order_batch1` FOREIGN KEY (`zip_id`) REFERENCES `zip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_trans_type1` FOREIGN KEY (`trans_type_id`) REFERENCES `transaction_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,1,2,'\0','3'),(2,1,2,'\0','3'),(3,1,2,'\0','3');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `num_code` varchar(3) NOT NULL,
  `alpha_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'036','AUD'),(2,'050','BDT'),(3,'096','BND'),(4,'124','CAD'),(5,'156','CNY'),(6,'978','EUR'),(7,'826','GBP'),(8,'344','HKD'),(9,'360','IDR'),(10,'356','INR'),(11,'392','JPY'),(12,'410','KRW'),(13,'144','LKR'),(14,'446','MOP'),(15,'480','MUR'),(16,'462','MVR'),(17,'458','MYR'),(18,'554','NZD'),(19,'598','PGK'),(20,'608','PHP'),(21,'702','SGD'),(22,'764','THB'),(23,'949','TRY'),(24,'901','TWD'),(25,'840','USD'),(26,'704','VND'),(27,'586','PKR'),(28,'756','CHF'),(29,'784','AED'),(30,'048','BHD'),(31,'512','OMR'),(32,'682','SAR'),(33,'704','VND');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demographic`
--

DROP TABLE IF EXISTS `demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demographic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `corporate` varchar(3) DEFAULT NULL,
  `region` varchar(2) NOT NULL,
  `principal` varchar(3) DEFAULT NULL,
  `associate` varchar(3) DEFAULT NULL,
  `chain` varchar(3) DEFAULT NULL,
  `merchant` varchar(16) NOT NULL,
  `merchantStatus` varchar(1) NOT NULL,
  `merchantCategoryCode` varchar(4) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `doingBusinessAs` varchar(32) NOT NULL,
  `attention` varchar(32) DEFAULT NULL,
  `firstAddress` varchar(32) DEFAULT NULL,
  `secondAddress` varchar(32) DEFAULT NULL,
  `city` varchar(28) DEFAULT NULL,
  `stateCountry` char(2) DEFAULT NULL,
  `postal` varchar(9) DEFAULT NULL,
  `spokenLanguage` varchar(1) DEFAULT NULL,
  `telephoneNumber` varchar(10) DEFAULT NULL,
  `acceptOtherCurrency` char(1) NOT NULL DEFAULT 'N',
  `acceptInstallment` char(1) NOT NULL DEFAULT 'N',
  `acceptRetailSales` char(1) NOT NULL DEFAULT 'N',
  `acceptCashAdvance` char(1) NOT NULL DEFAULT 'N',
  `acceptAmex` char(1) NOT NULL DEFAULT 'N',
  `acceptCup` char(1) NOT NULL DEFAULT 'N',
  `acceptJcb` char(1) NOT NULL DEFAULT 'N',
  `acceptMasterCard` varchar(1) NOT NULL DEFAULT 'N',
  `acceptPrivateLabel` char(1) NOT NULL DEFAULT 'N',
  `acceptVisa` char(1) NOT NULL DEFAULT 'N',
  `createdBy` varchar(45) NOT NULL DEFAULT 'SYSTEM',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographic`
--

LOCK TABLES `demographic` WRITE;
/*!40000 ALTER TABLE `demographic` DISABLE KEYS */;
INSERT INTO `demographic` VALUES (1,'019','19','002','001','000','0000000000000001','R','4411','MOP','TEST - PIONEER WOODLANDS        ','FLAT, FLOOR, BLOCK              ','BUILDING                        ','STREET                          ','MACAU                       ','MO','00000    ','M','0001234567','N','N','Y','N','N','Y','Y','Y','N','Y','1','2018-03-23 04:02:15'),(2,'019','19','002','001','000','0000000000000004','P','5099','MOP','DUMMY ACCOUNT 4                 ','111 FLOOR                       ','UNIT 299                        ','MAY STREET                      ','MACAU                       ','MO','0000     ','C','0001111111','N','N','Y','N','N','Y','Y','Y','N','Y','1','2018-03-23 04:02:15'),(3,'088','88','001','001','000','0000000000000444','P','5999','HKD','HK COPY PROTOTYPE               ','                                ','ABC                             ','                                ','*                           ','HK','         ',' ','0012345678','Y','N','Y','N','N','N','N','Y','N','Y','1','2018-03-23 04:02:15'),(4,'019','19','001','001','000','0000000000006010','P','6010','MOP','PROTOTYPE CASH ADVANCE          ','                                ','*                               ','                                ','MACAU                       ','MO','00000    ','E','0000123456','N','N','N','Y','N','N','N','Y','N','Y','1','2018-03-23 04:02:15'),(5,'088','88','001','001','000','0000000000008205','O','5969','HKD','MAS RTI PROD TEST - BUCKET      ','PHYS ADDR1                      ','PHYS ADDR2                      ','PHYS ADD3                       ','KOWLOON                     ','HK','000000000','C','1231231231','N','N','Y','N','N','N','N','Y','N','Y','1','2018-03-23 04:02:15'),(6,'019','19','001','001','000','0000000000008206','R','5969','MOP','MAS RTI TEST - 19               ','PHYS ADDR 1                     ','PHYSC ADDR 2                    ','PHYS ADDR 3                     ','KOWLOON                     ','HK','000000000','C','1111111111','N','C','Y','N','N','N','N','Y','N','Y','1','2018-03-23 04:02:15');
/*!40000 ALTER TABLE `demographic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `dictionaryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dictionaryWord` varchar(127) NOT NULL,
  PRIMARY KEY (`dictionaryID`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'123456'),(2,'able'),(3,'about'),(4,'above'),(5,'act'),(6,'add'),(7,'afraid'),(8,'after'),(9,'again'),(10,'against'),(11,'age'),(12,'ago'),(13,'agree'),(14,'air'),(15,'all'),(16,'allow'),(17,'also'),(18,'always'),(19,'am'),(20,'among'),(21,'an'),(22,'and'),(23,'anger'),(24,'animal'),(25,'answer'),(26,'any'),(27,'appear'),(28,'apple'),(29,'are'),(30,'area'),(31,'arm'),(32,'arrange'),(33,'arrive'),(34,'arsenal'),(35,'art'),(36,'as'),(37,'ask'),(38,'at'),(39,'atom'),(40,'baby'),(41,'back'),(42,'bad'),(43,'ball'),(44,'band'),(45,'bank'),(46,'bar'),(47,'base'),(48,'basic'),(49,'bat'),(50,'be'),(51,'bear'),(52,'beat'),(53,'beauty'),(54,'bed'),(55,'been'),(56,'before'),(57,'began'),(58,'begin'),(59,'behind'),(60,'believe'),(61,'bell'),(62,'best'),(63,'better'),(64,'between'),(65,'big'),(66,'bird'),(67,'bit'),(68,'black'),(69,'block'),(70,'blood'),(71,'blow'),(72,'blue'),(73,'board'),(74,'boat'),(75,'body'),(76,'bone'),(77,'book'),(78,'born'),(79,'both'),(80,'bottom'),(81,'bought'),(82,'box'),(83,'boy'),(84,'branch'),(85,'bread'),(86,'break'),(87,'bright'),(88,'bring'),(89,'broad'),(90,'broke'),(91,'brother'),(92,'brought'),(93,'brown'),(94,'build'),(95,'burn'),(96,'busy'),(97,'but'),(98,'buy'),(99,'by'),(100,'call'),(101,'came'),(102,'camp'),(103,'can'),(104,'capital'),(105,'captain'),(106,'car'),(107,'card'),(108,'care'),(109,'carry'),(110,'case'),(111,'cat'),(112,'catch'),(113,'caught'),(114,'cause'),(115,'cell'),(116,'cent'),(117,'center'),(118,'century'),(119,'certain'),(120,'chair'),(121,'chance'),(122,'change'),(123,'character'),(124,'charge'),(125,'charlie'),(126,'chart'),(127,'check'),(128,'chick'),(129,'chief'),(130,'child'),(131,'children'),(132,'choose'),(133,'chord'),(134,'circle'),(135,'city'),(136,'claim'),(137,'class'),(138,'clean'),(139,'clear'),(140,'climb'),(141,'clock'),(142,'close'),(143,'clothe'),(144,'cloud'),(145,'coast'),(146,'coat'),(147,'cold'),(148,'collect'),(149,'colony'),(150,'color'),(151,'column'),(152,'come'),(153,'common'),(154,'company'),(155,'compare'),(156,'complete'),(157,'condition'),(158,'connect'),(159,'consider'),(160,'consonant'),(161,'contain'),(162,'continent'),(163,'continue'),(164,'control'),(165,'cook'),(166,'cool'),(167,'copy'),(168,'corn'),(169,'corner'),(170,'correct'),(171,'cost'),(172,'cotton'),(173,'could'),(174,'count'),(175,'country'),(176,'course'),(177,'cover'),(178,'cow'),(179,'crease'),(180,'create'),(181,'crop'),(182,'cross'),(183,'crowd'),(184,'cry'),(185,'current'),(186,'cut'),(187,'dad'),(188,'dance'),(189,'danger'),(190,'dark'),(191,'day'),(192,'dead'),(193,'deal'),(194,'dear'),(195,'death'),(196,'decide'),(197,'decimal'),(198,'deep'),(199,'degree'),(200,'depend'),(201,'describe'),(202,'desert'),(203,'design'),(204,'determine'),(205,'develop'),(206,'dictionary'),(207,'did'),(208,'die'),(209,'differ'),(210,'difficult'),(211,'direct'),(212,'discuss'),(213,'distant'),(214,'divide'),(215,'division'),(216,'do'),(217,'doctor'),(218,'does'),(219,'dog'),(220,'dollar'),(221,'dont'),(222,'done'),(223,'door'),(224,'double'),(225,'down'),(226,'draw'),(227,'dream'),(228,'dress'),(229,'drink'),(230,'drive'),(231,'drop'),(232,'dry'),(233,'duck'),(234,'during'),(235,'each'),(236,'ear'),(237,'early'),(238,'earth'),(239,'ease'),(240,'east'),(241,'eat'),(242,'edge'),(243,'effect'),(244,'egg'),(245,'eight'),(246,'either'),(247,'electric'),(248,'element'),(249,'else'),(250,'end'),(251,'enemy'),(252,'energy'),(253,'engine'),(254,'enough'),(255,'enter'),(256,'equal'),(257,'equate'),(258,'especially'),(259,'even'),(260,'evening'),(261,'event'),(262,'ever'),(263,'every'),(264,'exact'),(265,'example'),(266,'except'),(267,'excite'),(268,'exercise'),(269,'expect'),(270,'experience'),(271,'experiment'),(272,'eye'),(273,'face'),(274,'fact'),(275,'fair'),(276,'fall'),(277,'family'),(278,'famous'),(279,'far'),(280,'farm'),(281,'fast'),(282,'fat'),(283,'father'),(284,'favor'),(285,'fear'),(286,'feed'),(287,'feel'),(288,'feet'),(289,'fell'),(290,'felt'),(291,'few'),(292,'field'),(293,'fig'),(294,'fight'),(295,'figure'),(296,'fill'),(297,'final'),(298,'find'),(299,'fine'),(300,'finger'),(301,'finish'),(302,'fire'),(303,'first'),(304,'fish'),(305,'fit'),(306,'five'),(307,'flat'),(308,'flood'),(309,'floor'),(310,'flow'),(311,'flower'),(312,'fly'),(313,'follow'),(314,'food'),(315,'foot'),(316,'for'),(317,'force'),(318,'forest'),(319,'form'),(320,'former'),(321,'forward'),(322,'found'),(323,'four'),(324,'fraction'),(325,'free'),(326,'fresh'),(327,'friend'),(328,'from'),(329,'front'),(330,'fruit'),(331,'full'),(332,'fun'),(333,'game'),(334,'garden'),(335,'gas'),(336,'gather'),(337,'gave'),(338,'general'),(339,'gentle'),(340,'get'),(341,'girl'),(342,'give'),(343,'glad'),(344,'glass'),(345,'go'),(346,'gold'),(347,'gone'),(348,'good'),(349,'got'),(350,'govern'),(351,'grand'),(352,'grass'),(353,'gray'),(354,'great'),(355,'green'),(356,'grew'),(357,'ground'),(358,'group'),(359,'grow'),(360,'guess'),(361,'guide'),(362,'gun'),(363,'had'),(364,'hair'),(365,'half'),(366,'hand'),(367,'happen'),(368,'happy'),(369,'hard'),(370,'has'),(371,'hat'),(372,'have'),(373,'he'),(374,'head'),(375,'hear'),(376,'heard'),(377,'heart'),(378,'heat'),(379,'heavy'),(380,'held'),(381,'help'),(382,'her'),(383,'here'),(384,'high'),(385,'hill'),(386,'him'),(387,'his'),(388,'history'),(389,'hit'),(390,'hold'),(391,'hole'),(392,'home'),(393,'hope'),(394,'horse'),(395,'hot'),(396,'hot'),(397,'hour'),(398,'house'),(399,'how'),(400,'huge'),(401,'human'),(402,'hundred'),(403,'hunt'),(404,'hurry'),(405,'ice'),(406,'idea'),(407,'if'),(408,'imagine'),(409,'in'),(410,'inch'),(411,'include'),(412,'indicate'),(413,'industry'),(414,'insect'),(415,'instant'),(416,'instrument'),(417,'interest'),(418,'invent'),(419,'iron'),(420,'is'),(421,'island'),(422,'it'),(423,'job'),(424,'join'),(425,'joy'),(426,'jump'),(427,'just'),(428,'keep'),(429,'kept'),(430,'key'),(431,'kill'),(432,'kind'),(433,'king'),(434,'knew'),(435,'know'),(436,'lady'),(437,'lake'),(438,'land'),(439,'language'),(440,'large'),(441,'last'),(442,'late'),(443,'laugh'),(444,'law'),(445,'lay'),(446,'lead'),(447,'learn'),(448,'least'),(449,'leave'),(450,'led'),(451,'left'),(452,'leg'),(453,'length'),(454,'less'),(455,'let'),(456,'letmein'),(457,'letter'),(458,'level'),(459,'lie'),(460,'life'),(461,'lift'),(462,'light'),(463,'like'),(464,'line'),(465,'liquid'),(466,'list'),(467,'listen'),(468,'little'),(469,'live'),(470,'liverpool'),(471,'locate'),(472,'log'),(473,'lone'),(474,'long'),(475,'look'),(476,'lost'),(477,'lot'),(478,'loud'),(479,'love'),(480,'low'),(481,'machine'),(482,'made'),(483,'magnet'),(484,'main'),(485,'major'),(486,'make'),(487,'man'),(488,'many'),(489,'map'),(490,'mark'),(491,'market'),(492,'mass'),(493,'master'),(494,'match'),(495,'material'),(496,'matter'),(497,'may'),(498,'me'),(499,'mean'),(500,'meant'),(501,'measure'),(502,'meat'),(503,'meet'),(504,'melody'),(505,'men'),(506,'metal'),(507,'method'),(508,'middle'),(509,'might'),(510,'mile'),(511,'milk'),(512,'million'),(513,'mind'),(514,'mine'),(515,'minute'),(516,'miss'),(517,'mix'),(518,'modern'),(519,'molecule'),(520,'moment'),(521,'money'),(522,'monkey'),(523,'month'),(524,'moon'),(525,'more'),(526,'morning'),(527,'most'),(528,'mother'),(529,'motion'),(530,'mount'),(531,'mountain'),(532,'mouth'),(533,'move'),(534,'much'),(535,'multiply'),(536,'music'),(537,'must'),(538,'my'),(539,'name'),(540,'nation'),(541,'natural'),(542,'nature'),(543,'near'),(544,'necessary'),(545,'neck'),(546,'need'),(547,'neighbor'),(548,'never'),(549,'new'),(550,'next'),(551,'night'),(552,'nine'),(553,'no'),(554,'noise'),(555,'noon'),(556,'nor'),(557,'north'),(558,'nose'),(559,'note'),(560,'nothing'),(561,'notice'),(562,'noun'),(563,'now'),(564,'number'),(565,'numeral'),(566,'object'),(567,'observe'),(568,'occur'),(569,'ocean'),(570,'of'),(571,'off'),(572,'offer'),(573,'office'),(574,'often'),(575,'oh'),(576,'oil'),(577,'old'),(578,'on'),(579,'once'),(580,'one'),(581,'only'),(582,'open'),(583,'operate'),(584,'opposite'),(585,'or'),(586,'order'),(587,'organ'),(588,'original'),(589,'other'),(590,'our'),(591,'out'),(592,'over'),(593,'own'),(594,'oxygen'),(595,'page'),(596,'paint'),(597,'pair'),(598,'paper'),(599,'paragraph'),(600,'parent'),(601,'part'),(602,'particular'),(603,'party'),(604,'pass'),(605,'password'),(606,'past'),(607,'path'),(608,'pattern'),(609,'pay'),(610,'people'),(611,'perhaps'),(612,'period'),(613,'person'),(614,'phrase'),(615,'pick'),(616,'picture'),(617,'piece'),(618,'pitch'),(619,'place'),(620,'plain'),(621,'plan'),(622,'plane'),(623,'planet'),(624,'plant'),(625,'play'),(626,'please'),(627,'plural'),(628,'poem'),(629,'point'),(630,'poor'),(631,'populate'),(632,'port'),(633,'pose'),(634,'position'),(635,'possible'),(636,'post'),(637,'pound'),(638,'power'),(639,'practice'),(640,'prepare'),(641,'present'),(642,'press'),(643,'pretty'),(644,'print'),(645,'probable'),(646,'problem'),(647,'process'),(648,'produce'),(649,'product'),(650,'proper'),(651,'property'),(652,'protect'),(653,'prove'),(654,'provide'),(655,'pull'),(656,'push'),(657,'put'),(658,'quart'),(659,'question'),(660,'quick'),(661,'quiet'),(662,'quite'),(663,'quotient'),(664,'qwerty'),(665,'race'),(666,'radio'),(667,'rail'),(668,'rain'),(669,'raise'),(670,'ran'),(671,'range'),(672,'rather'),(673,'reach'),(674,'read'),(675,'ready'),(676,'real'),(677,'reason'),(678,'receive'),(679,'record'),(680,'red'),(681,'region'),(682,'remember'),(683,'repeat'),(684,'reply'),(685,'represent'),(686,'require'),(687,'rest'),(688,'result'),(689,'rich'),(690,'ride'),(691,'right'),(692,'ring'),(693,'rise'),(694,'river'),(695,'road'),(696,'rock'),(697,'roll'),(698,'room'),(699,'root'),(700,'rope'),(701,'rose'),(702,'round'),(703,'row'),(704,'rub'),(705,'rule'),(706,'run'),(707,'safe'),(708,'said'),(709,'sail'),(710,'salt'),(711,'same'),(712,'sand'),(713,'sat'),(714,'save'),(715,'saw'),(716,'say'),(717,'scale'),(718,'school'),(719,'science'),(720,'score'),(721,'sea'),(722,'search'),(723,'season'),(724,'seat'),(725,'second'),(726,'section'),(727,'see'),(728,'seed'),(729,'seem'),(730,'segment'),(731,'select'),(732,'self'),(733,'sell'),(734,'send'),(735,'sense'),(736,'sent'),(737,'sentence'),(738,'separate'),(739,'serve'),(740,'set'),(741,'settle'),(742,'seven'),(743,'several'),(744,'shall'),(745,'shape'),(746,'share'),(747,'sharp'),(748,'she'),(749,'sheet'),(750,'shell'),(751,'shine'),(752,'ship'),(753,'shoe'),(754,'shop'),(755,'shore'),(756,'short'),(757,'should'),(758,'shoulder'),(759,'shout'),(760,'show'),(761,'side'),(762,'sight'),(763,'sign'),(764,'silent'),(765,'silver'),(766,'similar'),(767,'simple'),(768,'since'),(769,'sing'),(770,'single'),(771,'sister'),(772,'sit'),(773,'six'),(774,'size'),(775,'skill'),(776,'skin'),(777,'sky'),(778,'slave'),(779,'sleep'),(780,'slip'),(781,'slow'),(782,'small'),(783,'smell'),(784,'smile'),(785,'snow'),(786,'so'),(787,'soft'),(788,'soil'),(789,'soldier'),(790,'solution'),(791,'solve'),(792,'some'),(793,'son'),(794,'song'),(795,'soon'),(796,'sound'),(797,'south'),(798,'space'),(799,'speak'),(800,'special'),(801,'speech'),(802,'speed'),(803,'spell'),(804,'spend'),(805,'spoke'),(806,'spot'),(807,'spread'),(808,'spring'),(809,'square'),(810,'stand'),(811,'star'),(812,'start'),(813,'state'),(814,'station'),(815,'stay'),(816,'stead'),(817,'steam'),(818,'steel'),(819,'step'),(820,'stick'),(821,'still'),(822,'stone'),(823,'stood'),(824,'stop'),(825,'store'),(826,'story'),(827,'straight'),(828,'strange'),(829,'stream'),(830,'street'),(831,'stretch'),(832,'string'),(833,'strong'),(834,'student'),(835,'study'),(836,'subject'),(837,'substance'),(838,'subtract'),(839,'success'),(840,'such'),(841,'sudden'),(842,'suffix'),(843,'sugar'),(844,'suggest'),(845,'suit'),(846,'summer'),(847,'sun'),(848,'supply'),(849,'support'),(850,'sure'),(851,'surface'),(852,'surprise'),(853,'swim'),(854,'syllable'),(855,'symbol'),(856,'system'),(857,'table'),(858,'tail'),(859,'take'),(860,'talk'),(861,'tall'),(862,'teach'),(863,'team'),(864,'teeth'),(865,'tell'),(866,'temperature'),(867,'ten'),(868,'term'),(869,'test'),(870,'than'),(871,'thank'),(872,'that'),(873,'the'),(874,'their'),(875,'them'),(876,'then'),(877,'there'),(878,'these'),(879,'they'),(880,'thick'),(881,'thin'),(882,'thing'),(883,'think'),(884,'third'),(885,'this'),(886,'thomas'),(887,'those'),(888,'though'),(889,'thought'),(890,'thousand'),(891,'three'),(892,'through'),(893,'throw'),(894,'thus'),(895,'tie'),(896,'time'),(897,'tiny'),(898,'tire'),(899,'to'),(900,'together'),(901,'told'),(902,'tone'),(903,'too'),(904,'took'),(905,'tool'),(906,'top'),(907,'total'),(908,'touch'),(909,'toward'),(910,'town'),(911,'track'),(912,'trade'),(913,'train'),(914,'travel'),(915,'tree'),(916,'triangle'),(917,'trip'),(918,'trouble'),(919,'truck'),(920,'TRUE'),(921,'try'),(922,'tube'),(923,'turn'),(924,'twenty'),(925,'two'),(926,'type'),(927,'under'),(928,'unit'),(929,'until'),(930,'up'),(931,'us'),(932,'use'),(933,'usual'),(934,'valley'),(935,'value'),(936,'vary'),(937,'verb'),(938,'very'),(939,'view'),(940,'village'),(941,'visit'),(942,'voice'),(943,'vowel'),(944,'wait'),(945,'walk'),(946,'wall'),(947,'want'),(948,'war'),(949,'warm'),(950,'was'),(951,'wash'),(952,'watch'),(953,'water'),(954,'wave'),(955,'way'),(956,'we'),(957,'wear'),(958,'weather'),(959,'week'),(960,'weight'),(961,'well'),(962,'went'),(963,'were'),(964,'west'),(965,'what'),(966,'wheel'),(967,'when'),(968,'where'),(969,'whether'),(970,'which'),(971,'while'),(972,'white'),(973,'who'),(974,'whole'),(975,'whose'),(976,'why'),(977,'wide'),(978,'wife'),(979,'wild'),(980,'will'),(981,'win'),(982,'wind'),(983,'window'),(984,'wing'),(985,'winter'),(986,'wire'),(987,'wish'),(988,'with'),(989,'woman'),(990,'women'),(991,'wont'),(992,'wonder'),(993,'wood'),(994,'word'),(995,'work'),(996,'world'),(997,'would'),(998,'write'),(999,'written'),(1000,'wrong'),(1001,'wrote'),(1002,'yard'),(1003,'year'),(1004,'yellow'),(1005,'yes'),(1006,'yet'),(1007,'you'),(1008,'young'),(1009,'your');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(250) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `zip_id` bigint(11) unsigned NOT NULL,
  `trans_type_id` tinyint(3) unsigned NOT NULL,
  `batch_id` bigint(11) unsigned DEFAULT NULL,
  `is_start` bit(1) DEFAULT b'0',
  `is_completed` bit(1) DEFAULT b'0',
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `fk_image_batch1_idx` (`zip_id`),
  KEY `fk_image_batch1_idx1` (`batch_id`),
  CONSTRAINT `fk_image_batch1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_image_zip1` FOREIGN KEY (`zip_id`) REFERENCES `zip` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'/BN/20100101-1-001/Airline/scan0001-5.tif',NULL,1,2,1,'','','3'),(2,'/BN/20100101-1-001/Airline/scan0002.tif',NULL,1,2,1,'\0','','3'),(3,'/BN/20100101-1-001/Airline/scan0003.tif',NULL,1,2,2,'','','3'),(4,'/BN/20100101-1-001/Airline/scan0004-10.tif',NULL,1,2,2,'\0','','3'),(5,'/BN/20100101-1-001/Airline/scan0010-10.tif',NULL,1,2,3,'','','3'),(6,'/BN/20100101-1-001/Airline/scan0011.tif',NULL,1,2,3,'\0','','3'),(26,'/BN/20100101-1-001/Credit/scan0001-5.tif',NULL,1,3,NULL,'\0','\0','1'),(27,'/BN/20100101-1-001/Credit/scan0002.tif',NULL,1,3,NULL,'\0','\0','1'),(28,'/BN/20100101-1-001/Credit/scan0003.tif',NULL,1,3,NULL,'\0','\0','1'),(29,'/BN/20100101-1-001/Credit/scan0004-10.tif',NULL,1,3,NULL,'\0','\0','1'),(30,'/BN/20100101-1-001/Credit/scan0010-10.tif',NULL,1,3,NULL,'\0','\0','1'),(31,'/BN/20100101-1-001/Credit/scan0011.tif',NULL,1,3,NULL,'\0','\0','1'),(33,'/BN/20100101-3-001/Airline/scan0001-5.tif',NULL,2,2,NULL,'\0','\0','1'),(34,'/BN/20100101-3-001/Airline/scan0002.tif',NULL,2,2,NULL,'\0','\0','1'),(35,'/BN/20100101-3-001/Airline/scan0003.tif',NULL,2,2,NULL,'\0','\0','1'),(36,'/BN/20100101-3-001/Airline/scan0004-10.tif',NULL,2,2,NULL,'\0','\0','1'),(37,'/BN/20100101-3-001/Airline/scan0010-10.tif',NULL,2,2,NULL,'\0','\0','1'),(38,'/BN/20100101-3-001/Airline/scan0011.tif',NULL,2,2,NULL,'\0','\0','1'),(40,'/BN/20100101-3-001/Credit/scan0001-5.tif',NULL,2,3,NULL,'\0','\0','2'),(41,'/BN/20100101-3-001/Credit/scan0002.tif',NULL,2,3,NULL,'\0','\0','2'),(42,'/BN/20100101-3-001/Credit/scan0003.tif',NULL,2,3,NULL,'\0','\0','2'),(43,'/BN/20100101-3-001/Credit/scan0004-10.tif',NULL,2,3,NULL,'\0','\0','2'),(44,'/BN/20100101-3-001/Credit/scan0010-10.tif',NULL,2,3,NULL,'\0','\0','2'),(45,'/BN/20100101-3-001/Credit/scan0011.tif',NULL,2,3,NULL,'\0','\0','2'),(47,'/HK/20180101-2-003/Normal Purchase/Scan0001.tif',NULL,3,1,NULL,'\0','\0','1'),(48,'/BN/20100101-2-001/Airline/scan0001-5.tif',NULL,5,2,NULL,'\0','\0','1'),(49,'/BN/20100101-2-001/Airline/scan0002.tif',NULL,5,2,NULL,'\0','\0','1'),(50,'/BN/20100101-2-001/Airline/scan0003.tif',NULL,5,2,NULL,'\0','\0','1'),(51,'/BN/20100101-2-001/Airline/scan0004-10.tif',NULL,5,2,NULL,'\0','\0','1'),(52,'/BN/20100101-2-001/Airline/scan0010-10.tif',NULL,5,2,NULL,'\0','\0','1'),(53,'/BN/20100101-2-001/Airline/scan0011.tif',NULL,5,2,NULL,'\0','\0','1'),(55,'/BN/20100101-2-001/Credit/scan0001-5.tif',NULL,5,3,NULL,'\0','\0','1'),(56,'/BN/20100101-2-001/Credit/scan0002.tif',NULL,5,3,NULL,'\0','\0','1'),(57,'/BN/20100101-2-001/Credit/scan0003.tif',NULL,5,3,NULL,'\0','\0','1'),(58,'/BN/20100101-2-001/Credit/scan0004-10.tif',NULL,5,3,NULL,'\0','\0','1'),(59,'/BN/20100101-2-001/Credit/scan0010-10.tif',NULL,5,3,NULL,'\0','\0','1'),(60,'/BN/20100101-2-001/Credit/scan0011.tif',NULL,5,3,NULL,'\0','\0','1');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index`
--

DROP TABLE IF EXISTS `index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) unsigned NOT NULL,
  `is_start` bit(1) DEFAULT b'0',
  `is_completed` bit(1) DEFAULT b'0',
  `created_by` varchar(25) DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index`
--

LOCK TABLES `index` WRITE;
/*!40000 ALTER TABLE `index` DISABLE KEYS */;
INSERT INTO `index` VALUES (1,1,'','','1'),(2,2,'\0','','1'),(3,3,'','','1'),(4,4,'\0','','1'),(5,5,'','','1'),(6,6,'\0','','1'),(8,1,'','','2'),(9,2,'\0','','2'),(10,3,'','','2'),(11,4,'\0','','2'),(12,5,'','','2'),(13,6,'\0','','2'),(15,26,'','','1'),(16,27,'\0','','1'),(17,28,'\0','','1'),(18,29,'','','1'),(19,30,'\0','','1'),(20,31,'\0','','1'),(22,33,'','','1'),(23,34,'\0','','1'),(24,35,'\0','','1'),(25,36,'','','1'),(26,37,'\0','','1'),(27,38,'\0','','1'),(29,40,'','','2'),(30,41,'\0','','2'),(31,42,'','','2'),(32,43,'\0','','2'),(33,44,'\0','','2'),(34,45,'','','2'),(36,33,'','','2'),(37,34,'\0','','2'),(38,35,'','','2'),(39,36,'\0','','2'),(40,37,'\0','','2'),(41,38,'','','2'),(43,26,'','','2'),(44,27,'\0','','2'),(45,28,'','','2'),(46,29,'\0','','2'),(47,30,'\0','','2'),(48,31,'','','2'),(50,47,'','\0','1'),(51,48,'','\0','1'),(52,49,'\0','\0','1'),(53,50,'\0','\0','1'),(54,51,'\0','\0','1'),(55,52,'','\0','1'),(56,53,'\0','\0','1'),(58,48,'\0','','2'),(59,49,'','','2'),(60,50,'\0','','2'),(61,51,'','','2'),(62,52,'\0','','2'),(63,53,'','','2'),(65,55,'','\0','1'),(66,56,'\0','\0','1'),(67,57,'\0','\0','1'),(68,58,'\0','\0','1'),(69,59,'\0','\0','1'),(70,60,'\0','\0','1');
/*!40000 ALTER TABLE `index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installment_months`
--

DROP TABLE IF EXISTS `installment_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installment_months` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installment_months`
--

LOCK TABLES `installment_months` WRITE;
/*!40000 ALTER TABLE `installment_months` DISABLE KEYS */;
INSERT INTO `installment_months` VALUES (1,'2 Months'),(2,'3 Months'),(3,'4 Months'),(4,'6 Months'),(5,'8 Months'),(6,'9 Months'),(7,'10 Months'),(8,'11 Months'),(9,'12 Months'),(10,'13 Months'),(11,'14 Months'),(12,'15 Months'),(13,'17 Months'),(14,'18 Months'),(15,'19 Months'),(16,'21 Months'),(17,'22 Months'),(18,'23 Months'),(19,'24 Months'),(20,'25 Months'),(21,'30 Months'),(22,'33 Months'),(23,'36 Months'),(24,'48 Months'),(25,'60 Months');
/*!40000 ALTER TABLE `installment_months` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `corporate` char(3) DEFAULT NULL,
  `region` char(2) NOT NULL,
  `principal` char(3) DEFAULT NULL,
  `associate` char(3) DEFAULT NULL,
  `chain` char(3) DEFAULT NULL,
  `account_number` char(16) NOT NULL,
  `status` char(1) NOT NULL,
  `mcc` char(4) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `dba_name` varchar(32) NOT NULL,
  `attention` varchar(32) DEFAULT NULL,
  `address1` varchar(32) DEFAULT NULL,
  `address2` varchar(32) DEFAULT NULL,
  `city` varchar(28) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `postal_code` varchar(9) DEFAULT NULL,
  `language` char(1) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `accept_other_cncy` char(1) NOT NULL DEFAULT 'N',
  `accept_installments` char(1) NOT NULL DEFAULT 'N',
  `accept_retail_sales` char(1) NOT NULL DEFAULT 'N',
  `accept_cash_advance` char(1) NOT NULL DEFAULT 'N',
  `accept_amex` char(1) NOT NULL DEFAULT 'N',
  `accept_cup` char(1) NOT NULL DEFAULT 'N',
  `accept_jcb` char(1) NOT NULL DEFAULT 'N',
  `accept_mastercard` char(1) NOT NULL DEFAULT 'N',
  `accept_privatelabel` char(1) NOT NULL DEFAULT 'N',
  `accept_visa` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (1,NULL,'19',NULL,NULL,NULL,'0000000000000001','R',NULL,'MOP','TEST - PIONEER WOODLANDS        ',NULL,NULL,NULL,NULL,'MO',NULL,NULL,NULL,'N','N','Y','N','N','Y','Y','Y','N','Y'),(2,NULL,'19',NULL,NULL,NULL,'0000000000000004','P',NULL,'MOP','DUMMY ACCOUNT 4                ',NULL,NULL,NULL,NULL,'MO',NULL,NULL,NULL,'N','N','Y','N','N','Y','Y','Y','N','Y'),(3,NULL,'88',NULL,NULL,NULL,'0000000000000444','P',NULL,'HKD','HK COPY PROTOTYPE               ',NULL,NULL,NULL,NULL,'HK',NULL,NULL,NULL,'Y','N','Y','N','N','N','N','Y','N','Y'),(4,NULL,'19',NULL,NULL,NULL,'0000000000006010','P',NULL,'MOP','PROTOTYPE CASH ADVANCE          ',NULL,NULL,NULL,NULL,'MO',NULL,NULL,NULL,'N','N','N','Y','N','N','N','Y','N','Y'),(5,NULL,'88',NULL,NULL,NULL,'0000000000008205','O',NULL,'HKD','MAS RTI PROD TEST - BUCKET      ',NULL,NULL,NULL,NULL,'HK',NULL,NULL,NULL,'N','N','Y','N','N','N','N','Y','N','Y'),(6,NULL,'19',NULL,NULL,NULL,'0000000000008206','R',NULL,'MOP','MAS RTI TEST - 19               ',NULL,NULL,NULL,NULL,'HK',NULL,NULL,NULL,'N','C','Y','N','N','N','N','Y','N','Y');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_header`
--

DROP TABLE IF EXISTS `merchant_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_header` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(11) unsigned NOT NULL,
  `merchant_number` char(16) DEFAULT NULL,
  `merchant_name` varchar(250) DEFAULT NULL,
  `currency_id` tinyint(3) unsigned DEFAULT NULL,
  `dcn` char(7) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `deposit_amount` varchar(13) DEFAULT NULL,
  `pull_reason_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`batch_id`),
  KEY `fk_batch_header_currency1_idx` (`currency_id`),
  KEY `fk_batch_header_pull_reason1_idx` (`pull_reason_id`),
  KEY `fk_merchant_header_batch1_idx` (`batch_id`),
  CONSTRAINT `fk_batch_header_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_batch_header_pull_reason1` FOREIGN KEY (`pull_reason_id`) REFERENCES `pull_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_merchant_header_batch1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_header`
--

LOCK TABLES `merchant_header` WRITE;
/*!40000 ALTER TABLE `merchant_header` DISABLE KEYS */;
INSERT INTO `merchant_header` VALUES (1,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000265','2018-03-28','520.00',1),(3,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000004','2018-03-28','4.00',NULL),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,1),(5,1,'0000000000000444','HK COPY PROTOTYPE               ',NULL,'0000000',NULL,NULL,2),(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000065','2018-03-28','654.00',NULL),(23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000032','2018-03-28','32.00',NULL),(28,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000032','2018-03-28','32.00',NULL),(29,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000005','2018-03-28','5.00',NULL),(30,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000005','2018-03-28','5.00',NULL),(31,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000005','2018-03-28','5.00',NULL),(32,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-02-01','2.00',NULL),(33,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-02-01','2.00',NULL),(34,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-02-01','2.00',NULL),(35,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-02-01','2.00',NULL),(36,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000002','2018-03-28','2.00',NULL),(37,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000002','2018-03-28','2.00',NULL),(38,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000002','2018-03-28','2.00',NULL),(39,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000002','2018-03-28','2.00',NULL),(40,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-03-28','2.00',NULL),(41,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-03-28','2.00',NULL),(42,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-03-28','2.00',NULL),(43,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-03-28','2.00',NULL),(44,1,'0000000000000444','HK COPY PROTOTYPE               ',1,'0000002','2018-03-28','2.00',NULL),(45,1,'0000000000000444','HK COPY PROTOTYPE               ',2,'0000005','2018-03-28','6565.00',NULL);
/*!40000 ALTER TABLE `merchant_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_exception`
--

DROP TABLE IF EXISTS `other_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_exception` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_exception`
--

LOCK TABLES `other_exception` WRITE;
/*!40000 ALTER TABLE `other_exception` DISABLE KEYS */;
INSERT INTO `other_exception` VALUES (1,'Merchant Number'),(2,'Currency Code'),(3,'DCN'),(4,'Trailer Batch Amount'),(5,'Transaction Type'),(6,'Region'),(7,'Card Number'),(8,'Transaction Date'),(9,'Authorization Code'),(10,'Transaction Amount'),(11,'Installment Months'),(12,'Airline Ticket Number'),(13,'Customer Reference Identifier'),(14,'Merchant Order Number'),(15,'Commodity Code'),(16,'Others');
/*!40000 ALTER TABLE `other_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pull_reason`
--

DROP TABLE IF EXISTS `pull_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_reason` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `level` set('Batch','Slip') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pull_reason`
--

LOCK TABLES `pull_reason` WRITE;
/*!40000 ALTER TABLE `pull_reason` DISABLE KEYS */;
INSERT INTO `pull_reason` VALUES (1,'Invalid Merchant','Merchant not exist in demographic file','Batch'),(2,'Invalid Merchant','Merchant status is neither ‘O’pen nor ‘R’eopened','Batch'),(3,'Invalid Currency','The transaction currency is invalid in the region','Batch'),(4,'Invalid Currency','The transaction currency is not accepted for the merchant account','Batch'),(5,'Invalid Currency','The currency marked on deposit summary slip and sales slip is unmatched','Batch'),(6,'Invalid Batch DCN','Same DCN within the same Region on the same day','Batch'),(7,'Invalid Batch DCN','Same DCN, same MID, same total amount within the same Region in the historical record','Batch'),(8,'Invalid Batch DCN','DCN is less or more than 7 digits','Batch'),(9,'Invalid Card Type','Card type is not supported by merchant','Slip'),(10,'Invalid Card Number',NULL,'Slip'),(11,'Invalid Transaction Date','No transaction date','Slip'),(12,'Invalid Transaction Date','Transaction date is older than 11 months','Slip'),(13,'Invalid Transaction Date','Future date is provided','Slip'),(14,'Invalid Transaction Date','Invalid date eg. 31 Feb','Slip'),(15,'Invalid Authorization Code','Authorization code is less than 3 digits or more than 6 digits','Slip'),(16,'Invalid Authorization Code','No Authorization code is provided on the slip/form','Slip'),(17,'Invalid Installment Month','Merchant is not valid for Installment transaction','Slip'),(18,'Invalid Installment Month','Installment term is not supported for the merchant','Slip'),(19,'Invalid Installment Month','Installment is supported but no installment month is indicated on the sale slip or credit slip','Slip');
/*!40000 ALTER TABLE `pull_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `code` char(2) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL,
  PRIMARY KEY (`code`,`created_by`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `fk_region_user1_idx` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('BN','Brunei','SYSTEM'),('HK','Hong Kong','SYSTEM'),('MO','Macau','SYSTEM'),('MV','Maldives','SYSTEM'),('PH','Philippines','SYSTEM'),('SG','Singapore','SYSTEM'),('SL','Sri Lanka','SYSTEM');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_currency`
--

DROP TABLE IF EXISTS `region_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_currency` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` char(2) NOT NULL,
  `currency_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region_currency_region1_idx` (`region_code`),
  KEY `fk_region_currency_currency1_idx` (`currency_id`),
  CONSTRAINT `fk_region_currency_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_region_currency_region1` FOREIGN KEY (`region_code`) REFERENCES `region` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_currency`
--

LOCK TABLES `region_currency` WRITE;
/*!40000 ALTER TABLE `region_currency` DISABLE KEYS */;
INSERT INTO `region_currency` VALUES (1,'HK',1),(2,'HK',2),(3,'HK',3),(4,'HK',4),(5,'HK',5),(6,'HK',6),(7,'HK',7),(8,'HK',8),(9,'HK',9),(10,'HK',10),(11,'HK',11),(12,'HK',12),(13,'HK',13),(14,'HK',14),(15,'HK',15),(16,'HK',16),(17,'HK',17),(18,'HK',18),(19,'HK',19),(20,'HK',20),(21,'HK',21),(22,'HK',22),(23,'HK',23),(24,'HK',24),(25,'HK',25),(26,'HK',26),(27,'HK',27),(28,'MO',1),(29,'MO',2),(30,'MO',3),(31,'MO',4),(32,'MO',5),(33,'MO',6),(34,'MO',7),(35,'MO',8),(36,'MO',9),(37,'MO',10),(38,'MO',11),(39,'MO',12),(40,'MO',13),(41,'MO',14),(42,'MO',15),(43,'MO',16),(44,'MO',17),(45,'MO',18),(46,'MO',19),(47,'MO',20),(48,'MO',21),(49,'MO',22),(50,'MO',23),(51,'MO',24),(52,'MO',25),(53,'MO',26),(54,'MO',27),(55,'MV',25),(56,'SG',8),(57,'SG',25),(58,'SG',21),(59,'SL',1),(60,'SL',6),(61,'SL',7),(62,'SL',11),(63,'SL',13),(64,'SL',25),(65,'SL',28),(66,'BN',1),(67,'BN',3),(68,'BN',6),(69,'BN',7),(70,'BN',8),(71,'BN',18),(72,'BN',21),(73,'BN',22),(74,'BN',25),(75,'BN',29),(76,'BN',30),(77,'BN',31),(78,'BN',32),(79,'PH',1),(80,'PH',3),(81,'PH',4),(82,'PH',5),(83,'PH',6),(84,'PH',7),(85,'PH',8),(86,'PH',9),(87,'PH',11),(88,'PH',12),(89,'PH',14),(90,'PH',17),(91,'PH',20),(92,'PH',21),(93,'PH',22),(94,'PH',24),(95,'PH',25),(96,'PH',26),(97,'PH',29),(98,'PH',32),(99,'PH',33);
/*!40000 ALTER TABLE `region_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleName` varchar(32) NOT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','ACTIVE','SYSTEM'),(2,'Indexer','ACTIVE','SYSTEM'),(3,'Comparer','ACTIVE','SYSTEM');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL,
  PRIMARY KEY (`id`,`created_by`),
  KEY `fk_task_user_idx` (`created_by`),
  CONSTRAINT `fk_task_user` FOREIGN KEY (`created_by`) REFERENCES `user1` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (6,'Indexing 1',NULL,''),(7,'Indexing 2',NULL,''),(8,'Indexing Compare',NULL,''),(9,'Entry 1',NULL,''),(10,'Verify',NULL,'');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '	',
  `merchant_header_id` bigint(11) unsigned NOT NULL,
  `sequence` tinyint(3) NOT NULL,
  `transaction_type_id` tinyint(3) unsigned NOT NULL,
  `region_code` char(2) DEFAULT NULL,
  `card_number` varchar(19) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `authorization_code` char(6) DEFAULT NULL,
  `transaction_amount` tinyint(9) DEFAULT NULL,
  `installment_months_id` tinyint(2) unsigned DEFAULT NULL,
  `airline_ticket_number` varchar(13) DEFAULT NULL,
  `customer_reference_identifier` varchar(17) DEFAULT NULL,
  `merchant_order_number` varchar(25) DEFAULT NULL,
  `commodity_code` char(4) DEFAULT NULL,
  `pull_reason_id` tinyint(3) unsigned DEFAULT NULL,
  `exception_id` tinyint(2) unsigned DEFAULT NULL,
  `variance_exception` bit(1) DEFAULT NULL,
  `other_exception_detail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`merchant_header_id`,`transaction_type_id`),
  KEY `fk_transaction_merchant_header1_idx` (`merchant_header_id`),
  KEY `fk_transaction_transaction_type1_idx` (`transaction_type_id`),
  KEY `fk_transaction_pull_reason1_idx` (`pull_reason_id`),
  KEY `fk_transaction_installment_months1_idx` (`installment_months_id`),
  CONSTRAINT `fk_transaction_installment_months1` FOREIGN KEY (`installment_months_id`) REFERENCES `installment_months` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_merchant_header1` FOREIGN KEY (`merchant_header_id`) REFERENCES `merchant_header` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_pull_reason1` FOREIGN KEY (`pull_reason_id`) REFERENCES `pull_reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_transaction_type1` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,43,0,1,'F',NULL,'2018-03-28','000002',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(2,44,0,1,'PH',NULL,'2018-03-28','000002',2,NULL,NULL,NULL,NULL,NULL,9,NULL,'',NULL),(3,44,0,4,'PH',NULL,'2018-03-28','000003',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(4,45,1,1,'PH',NULL,'2018-03-28','000005',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL),(5,45,2,4,'D',NULL,'2018-03-28','000002',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_by` varchar(25) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`id`),
  KEY `fk_trans_type_user1_idx` (`created_by`),
  CONSTRAINT `fk_trans_type_user1` FOREIGN KEY (`created_by`) REFERENCES `user1` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'Normal Purchase',NULL,'SYSTEM'),(2,'Airline',NULL,'SYSTEM'),(3,'Credit',NULL,'SYSTEM'),(4,'Cash Advance',NULL,'SYSTEM'),(5,'Airline Credit',NULL,'SYSTEM'),(6,'VI (HK only)',NULL,'SYSTEM');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `userLastName` varchar(64) NOT NULL,
  `userFirstName` varchar(64) NOT NULL,
  `userMiddleName` varchar(64) DEFAULT '',
  `userPassword` char(60) NOT NULL,
  `userLastLogin` timestamp NULL DEFAULT NULL,
  `userInvalidLoginAttempt` int(11) NOT NULL DEFAULT 0,
  `userLastPasswordChange` timestamp NOT NULL DEFAULT current_timestamp(),
  `userEmail` varchar(128) DEFAULT NULL,
  `userTeam` varchar(64) DEFAULT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  KEY `idx_user_common` (`createStatus`,`userTeam`,`userLastPasswordChange`,`userInvalidLoginAttempt`,`userLastLogin`,`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','admin','','$2a$10$22fSnl/zCT0oJy/1nRmkleEqsI4dJ/fT8YOuFqppHRt/y2xhAbK/.','2018-03-27 10:37:45',0,'2018-03-21 01:50:49','test@test.com',NULL,'ACTIVE','admin'),(2,'1','Madrigalejos','Danilo','','$2a$10$22fSnl/zCT0oJy/1nRmkleEqsI4dJ/fT8YOuFqppHRt/y2xhAbK/.','2018-03-27 09:46:49',0,'2018-03-20 07:08:12','test@test.com',NULL,'ACTIVE','admin'),(3,'2','Villanueva','Rommel','','$2a$10$22fSnl/zCT0oJy/1nRmkleEqsI4dJ/fT8YOuFqppHRt/y2xhAbK/.','2018-03-27 07:49:00',0,'2018-03-20 07:08:12','test@test.com',NULL,'ACTIVE','SYSTEM'),(4,'3','Comparer','Comparer','usertest','$2a$10$22fSnl/zCT0oJy/1nRmkleEqsI4dJ/fT8YOuFqppHRt/y2xhAbK/.','2018-03-27 05:19:41',0,'2018-03-20 07:08:12','test@test.com','team1','ACTIVE','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_prev_password`
--

DROP TABLE IF EXISTS `user_prev_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prev_password` (
  `userprevpasswordID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `userPassword` char(60) NOT NULL,
  `userprevpasswordChange` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`userprevpasswordID`),
  KEY `fk_user_prev_password_userID_idx` (`userID`),
  CONSTRAINT `fk_user_prev_password_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_prev_password`
--

LOCK TABLES `user_prev_password` WRITE;
/*!40000 ALTER TABLE `user_prev_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_prev_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_role_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned NOT NULL,
  `roleID` int(10) unsigned NOT NULL,
  `createStatus` enum('ACTIVE','INACTIVE','DELETED') NOT NULL DEFAULT 'ACTIVE',
  `createdBy` varchar(32) NOT NULL DEFAULT 'SYSTEM',
  PRIMARY KEY (`user_role_ID`),
  KEY `user_role_roleID_idx` (`roleID`),
  KEY `user_role_userID_idx` (`userID`),
  CONSTRAINT `user_role_roleID` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`),
  CONSTRAINT `user_role_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,'ACTIVE','SYSTEM'),(2,2,2,'ACTIVE','SYSTEM'),(3,3,2,'ACTIVE','SYSTEM'),(4,4,3,'ACTIVE','SYSTEM');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip`
--

DROP TABLE IF EXISTS `zip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `region_code` char(2) NOT NULL,
  `rec_date` date NOT NULL,
  `operator_id` tinyint(4) unsigned NOT NULL,
  `sequence` tinyint(4) unsigned NOT NULL,
  `created_by` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batch_user1_idx` (`created_by`),
  KEY `fk_batch_region1_idx` (`region_code`),
  CONSTRAINT `fk_batch_region1` FOREIGN KEY (`region_code`) REFERENCES `region` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip`
--

LOCK TABLES `zip` WRITE;
/*!40000 ALTER TABLE `zip` DISABLE KEYS */;
INSERT INTO `zip` VALUES (1,'BN','2010-01-01',1,1,'1'),(2,'BN','2010-01-01',3,1,'1'),(3,'HK','2018-01-01',2,3,'1'),(4,'PH','2010-01-01',1,1,'1'),(5,'BN','2010-01-01',2,1,'1');
/*!40000 ALTER TABLE `zip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gpap'
--

--
-- Dumping routines for database 'gpap'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-28 21:49:41
