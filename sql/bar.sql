-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: bar
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `adminapplylog`
--

DROP TABLE IF EXISTS `adminapplylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminapplylog` (
  `id` int(11) NOT NULL,
  `applyUser` int(11) DEFAULT NULL,
  `applyPosition` varchar(255) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `applyContent` text,
  `applyOperation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_adminapplylog_TO_user` (`applyUser`),
  CONSTRAINT `FK_adminapplylog_TO_user` FOREIGN KEY (`applyUser`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminapplylog`
--

LOCK TABLES `adminapplylog` WRITE;
/*!40000 ALTER TABLE `adminapplylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminapplylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminUser` int(11) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `lid` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnkp5279f28ii10xvo6m3qasn8` (`lid`),
  KEY `FKe6ki87dy86aack3sqmkfds9xt` (`position`),
  KEY `FKnaf66n4i4tgmjamwxolwujlg8` (`adminUser`),
  KEY `FKsktxwthh8qmdip7fxdpyv5xtq` (`operator`),
  CONSTRAINT `FKnaf66n4i4tgmjamwxolwujlg8` FOREIGN KEY (`adminUser`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKsktxwthh8qmdip7fxdpyv5xtq` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_adminlog_adminUser_TO_user` FOREIGN KEY (`adminUser`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_adminlog_operator_TO_user` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlog`
--

LOCK TABLES `adminlog` WRITE;
/*!40000 ALTER TABLE `adminlog` DISABLE KEYS */;
INSERT INTO `adminlog` VALUES (14,8,'添加小吧',1,'2016-05-14 21:19:56',NULL,NULL),(15,2,'移除小吧',1,'2016-05-18 23:20:43',NULL,NULL),(16,2,'添加小吧',1,'2016-05-18 23:21:08',NULL,NULL),(17,3,'添加小吧',1,'2016-06-08 21:04:10',NULL,NULL),(18,4,'添加小吧',1,'2016-06-08 21:05:28',NULL,NULL),(19,4,'添加小吧',1,'2016-06-08 21:05:28',NULL,NULL),(20,8,'添加小吧',1,'2016-06-08 21:05:44',NULL,NULL),(21,2,'移除小吧',1,'2016-06-08 21:06:16',NULL,NULL),(22,2,'添加小吧',1,'2016-06-08 21:06:28',NULL,NULL),(23,5,'添加小吧',1,'2016-06-08 21:19:00',NULL,NULL),(24,5,'移除小吧',1,'2016-06-08 21:19:25',NULL,NULL);
/*!40000 ALTER TABLE `adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barlog`
--

DROP TABLE IF EXISTS `barlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barlog` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `userNum` int(11) DEFAULT NULL,
  `postNum` int(11) DEFAULT NULL,
  `floorNum` int(11) DEFAULT NULL,
  `signinNum` int(11) DEFAULT NULL,
  `newUserNum` int(11) DEFAULT NULL,
  `totalUserNum` int(11) DEFAULT NULL,
  `adminUserNum` int(11) DEFAULT NULL,
  `adminSigninNum` int(11) DEFAULT NULL,
  `adminPostNum` int(11) DEFAULT NULL,
  `adminFloorNum` int(11) DEFAULT NULL,
  `adminDeleteNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barlog`
--

LOCK TABLES `barlog` WRITE;
/*!40000 ALTER TABLE `barlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `barlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `floorNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `FKk5kghmkddc2fbvh48mihpw0k0` (`uid`),
  KEY `FKgq1km49xtseauhnfb5eabn9dx` (`pid`),
  CONSTRAINT `FKgq1km49xtseauhnfb5eabn9dx` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `FKk5kghmkddc2fbvh48mihpw0k0` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_floor` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `FK_floor_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,1,'asda的','2015-02-11 10:04:23','1',1),(2,1,'dsfsawd大厦','2015-02-11 11:04:24','1',2),(3,2,'ikhukhukhu','2015-02-13 12:04:25','1',3),(4,1,'ask老大','2015-02-11 10:04:24','2',1),(5,3,'大苏打','2015-02-13 18:04:25','1',4),(6,2,'似的发射点','2015-02-13 18:04:25','1',5),(7,3,'人体宴','2015-02-13 18:04:25','1',6),(8,1,'党规党法','2015-02-13 18:04:25','1',7),(9,3,'恶趣味','2015-02-13 18:04:25','1',8),(10,2,'额我认为','2015-02-13 18:04:25','1',9),(11,3,'士大夫士大夫','2015-02-13 18:04:25','1',10),(12,2,'二位','2015-02-13 18:04:25','1',11),(14,1,'<p>啊实打实大苏打上撒旦的视察三峡查杀<img src=\"http://img.baidu.com/hi/jx2/j_0068.gif\"/>啊实打实的<img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/></p>','2016-04-24 18:27:12','90CBD71B7AA24431B77877D96A43B335',1),(15,1,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p>','2016-04-24 18:39:56','AA290B3DCE964C1D9625A552B6A38D5D',1),(16,1,'<p>aaaa</p>','2016-04-24 19:11:48','00BAD797EF024FCBAF27FEAE317920AD',1),(17,1,'<p>aaaaaaaaaaaa</p>','2016-05-04 21:23:51','AA290B3DCE964C1D9625A552B6A38D5D',2),(18,4,'<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊<img src=\"http://img.baidu.com/hi/jx2/j_0030.gif\"/></p>','2016-05-04 21:26:02','AA290B3DCE964C1D9625A552B6A38D5D',3),(19,3,'<p>啊啊啊啊啊啊啊啊啊啊啊<img src=\"http://img.baidu.com/hi/jx2/j_0075.gif\"/></p>','2016-05-04 21:31:43','AA290B3DCE964C1D9625A552B6A38D5D',4),(20,2,'<p>qweqw啊实打实<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>','2016-05-04 21:33:57','AA290B3DCE964C1D9625A552B6A38D5D',5),(21,1,'<p>aaa啊啊啊啊<img src=\"http://img.baidu.com/hi/jx2/j_0063.gif\"/></p>','2016-05-04 21:37:15','AA290B3DCE964C1D9625A552B6A38D5D',6),(22,1,'<p>啊啊啊啊啊啊</p>','2016-05-04 21:41:09','AA290B3DCE964C1D9625A552B6A38D5D',7),(23,1,'<p>啊啊啊啊啊啊啊啊啊啊啊啊啊</p>','2016-05-04 21:42:46','AA290B3DCE964C1D9625A552B6A38D5D',8),(24,1,'<p>啊啊啊啊啊</p>','2016-05-04 21:43:34','AA290B3DCE964C1D9625A552B6A38D5D',9),(25,1,'<p>啊啊啊啊啊啊啊啊啊啊</p>','2016-05-04 21:45:27','AA290B3DCE964C1D9625A552B6A38D5D',10),(26,1,'<p>阿卡酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷</p>','2016-05-06 17:23:02','AA290B3DCE964C1D9625A552B6A38D5D',11),(27,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-11 17:17:49','95CA614B3828459C93B8D6DDB13CFFEA',1),(28,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-11 17:21:31','46F258200D1941E79ACF6ECF8CC73646',1),(29,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-11 17:24:00','89497DFE36694112908043A4BE811658',1),(30,1,'<p>dddddddddddddddddddddddd</p>','2016-05-11 17:37:51','C3243159FA734A218A252395ACF56752',1),(31,1,'<p>啊啊啊啊啊啊啊啊啊啊啊</p>','2016-05-12 08:37:16','EA88AEA1FBB341A09E32CAA2447C3C60',1),(32,2,'<p>aaaaaaaaaaa1</p>','2016-05-12 08:39:51','AA290B3DCE964C1D9625A552B6A38D5D',12),(33,2,'<p>aaaaaaaaaaaaaaa</p>','2016-05-12 08:46:55','EA88AEA1FBB341A09E32CAA2447C3C60',2),(34,2,'<p>aaaaaaaaaaaaaaaaaaa</p>','2016-05-12 08:47:16','3559179536FA48619727457422C2BC4C',1),(35,1,'<p>aaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-12 09:00:54','D85C04F576994D879A9B5160471EBC90',1),(36,1,'<p>aaaaaaaaaaaaaaaaaaaa</p>','2016-05-12 09:03:08','8F50EDB0374F4F26AAAAEEA15D010B4E',1),(37,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-12 09:15:18','81360B3E2E1945658C427EF5EC337C68',1),(38,1,'<p>aaaaaaaaaaaaaaaaa</p>','2016-05-12 09:24:50','1835FF7F25F84D19B8C961E7050745E4',1),(39,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-12 09:27:11','1835FF7F25F84D19B8C961E7050745E4',2),(40,1,'<p>aaaaaaaaaaaaaaaaa</p>','2016-05-12 09:34:12','5C3D81D1C681458782676AA87C5BF74D',1),(41,1,'<p>aaaaaaaaaaaaaaa</p>','2016-05-12 14:12:36','00FF18873E684DB4BC3D77B4BA2703AA',1),(42,1,'<p>aaaaaaaaaaa</p>','2016-05-12 14:12:45','00FF18873E684DB4BC3D77B4BA2703AA',2),(43,8,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-05-14 19:31:58','AA290B3DCE964C1D9625A552B6A38D5D',13),(44,8,'<p>ddddddddddddddddddddddddddddd</p>','2016-05-14 19:35:46','208E803F73BA465291E1C35E770B2A8B',1),(45,2,'<p>大三大四</p>','2016-05-14 19:45:13','B28DA4A6389044B69136127EBBE12B34',1),(46,2,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0049.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0009.gif\"/></p>','2016-05-14 19:45:35','D8BCEFBD01FB4687840A7F4B6BFD7879',1),(47,8,'<p>aaaaaaaaaaaaaaaaaaaaa</p>','2016-05-14 21:21:19','F1BA213700DB427DB3A72BF48BE39CF2',1),(48,1,'<p>sasdasdasd</p>','2016-05-18 23:14:30','47C77174F57F4143922F83983E8FB63A',1),(49,1,'<p>asdasdasdasdasd</p>','2016-05-18 23:14:43','47C77174F57F4143922F83983E8FB63A',2),(50,1,'<p>ssssss</p><p><img src=\"/bar1.0/image/upload/20160519/1463659601790010594.png\" title=\"1463659601790010594.png\" alt=\"吧务后台-1.png\"/></p>','2016-05-19 20:06:47','BDDC5F51B8A54A838FB075D28694BAB2',1),(51,1,'<p><img src=\"/bar1.0/image/upload/20160530/1464618321115052146.png\" title=\"1464618321115052146.png\" alt=\"吧务后台-1.png\"/></p>','2016-05-30 22:25:23','FDEC508CFADD418CB91DB801618A8FCE',1),(52,1,'<p>aaaaaaaaaaaaaaaaaaaa</p>','2016-06-03 13:53:03','36C44D6936F844598120F3852CAF6EA9',1),(53,1,'<p>aaaaaaaaaaaaaaa</p>','2016-06-03 13:56:35','7E509573D51349E09FB1DC6A1806FF7B',1),(56,1,'<p>sdasda</p>','2016-06-04 13:55:21','50445C6A920B41D0B486674C2EA9FB32',1),(57,1,'<p>dasdasd</p>','2016-06-04 14:05:27','BE1245BEB9D24CAD8D1874C0AC0AAE9E',1),(58,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaa</p>','2016-06-04 19:28:12','BE1245BEB9D24CAD8D1874C0AC0AAE9E',2),(59,1,'<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadsdasdasdas</p>','2016-06-04 19:29:32','BE1245BEB9D24CAD8D1874C0AC0AAE9E',3),(60,1,'<p><img src=\"/bar1.0/image/upload/20160604/1465039785503010216.png\" title=\"1465039785503010216.png\" alt=\"吧务后台-吧务团队-吧务考勤.png\"/></p>','2016-06-04 19:30:08','BE1245BEB9D24CAD8D1874C0AC0AAE9E',4),(61,1,'<p><img src=\"/bar2.0/image/upload/20160604/1465039898412025336.png\" title=\"1465039898412025336.png\" alt=\"吧务后台-1.png\"/></p>','2016-06-04 19:31:40','BE1245BEB9D24CAD8D1874C0AC0AAE9E',5),(62,1,'<p><img src=\"/bar2.0/image/upload/20160604/1465040305447071688.png\" title=\"1465040305447071688.png\" alt=\"吧务后台-1.png\"/></p>','2016-06-04 19:38:26','BE1245BEB9D24CAD8D1874C0AC0AAE9E',6),(63,1,'<p><img src=\"/bar2.0/image/upload/20160604/1465040880659030854.png\" title=\"1465040880659030854.png\" alt=\"吧务后台-1.png\"/></p>','2016-06-04 19:48:02','BE1245BEB9D24CAD8D1874C0AC0AAE9E',7),(64,1,'<p><img src=\"/bar2.0/image/upload/20160604/1465040902401036406.png\" title=\"1465040902401036406.png\" alt=\"吧务后台-吧务团队.png\"/></p>','2016-06-04 19:48:27','BE1245BEB9D24CAD8D1874C0AC0AAE9E',8),(65,1,'<p>撒打算<br/></p>','2016-06-05 12:45:09','5C3D81D1C681458782676AA87C5BF74D',2);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(255) DEFAULT NULL,
  `priviledges` int(11) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'1级',NULL),(2,'2级',NULL),(3,'3级',NULL);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'吧主'),(2,'小吧主'),(3,'图片小编'),(4,'语音小编'),(5,'视频小编'),(6,'广播小编');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `pid` varchar(255) NOT NULL,
  `ouid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ldate` datetime DEFAULT NULL,
  `content` text,
  `num` int(11) DEFAULT NULL,
  `luid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FK2lfsrr4ql39d97k7euhdto9jk` (`ouid`),
  KEY `FKk8e5cn32fn75fsxmpiqh9hvxy` (`luid`),
  KEY `FK7sy3d0ctm62kb6nc0iyhj0e2v` (`status`),
  CONSTRAINT `FK2lfsrr4ql39d97k7euhdto9jk` FOREIGN KEY (`ouid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKk8e5cn32fn75fsxmpiqh9hvxy` FOREIGN KEY (`luid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_post_luser` FOREIGN KEY (`luid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_post_ouser` FOREIGN KEY (`ouid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('00BAD797EF024FCBAF27FEAE317920AD',1,'aaaa',1,'2016-04-24 19:11:48','<p>aaaa</p>',1,1),('00FF18873E684DB4BC3D77B4BA2703AA',1,'aaaaaaaaaaa',1,'2016-05-12 14:12:36','<p>aaaaaaaaaaaaaaa</p>',2,1),('086FD02C132F4C0AAD1D9D8A41B2E87D',1,'阿拉斯加道路喀什觉得',1,'2016-04-24 12:54:30','<p>机阿里山到家啦开始建立的机阿里山到家啦开始建立的机阿里山到家啦开始建立的机阿里山到家啦开始建立的机阿里山到家啦开始建立的机阿里山到家啦开始建立<img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\">djahsidhai<img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\">aaaaaa</p>',5,1),('1',1,'阿斯达卡',1,'2015-02-11 10:04:23','xzxczxczx',3,1),('10',2,'认为',1,'2015-02-11 19:04:23','让他也让他',1,3),('11',1,'部分',1,'2015-02-11 19:04:23','他个人',1,1),('1835FF7F25F84D19B8C961E7050745E4',1,'aaaaaaaaaaaaaaaaaaa',1,'2016-05-12 09:24:50','<p>aaaaaaaaaaaaaaaaa</p>',2,1),('2',1,'zasd',1,'2015-02-11 19:04:23','zxczxczxc',1,1),('208E803F73BA465291E1C35E770B2A8B',8,'aaaaaaaaaaaa',1,'2016-05-14 19:35:46','<p>ddddddddddddddddddddddddddddd</p>',1,8),('3',1,'阿斯顿',1,'2015-02-11 19:04:23','出租车',1,1),('3559179536FA48619727457422C2BC4C',2,'aaaaaaaaaaa',1,'2016-05-12 08:47:16','<p>aaaaaaaaaaaaaaaaaaa</p>',1,2),('36C44D6936F844598120F3852CAF6EA9',1,'aaaaaaaaaa',1,'2016-06-03 13:53:03','<p>aaaaaaaaaaaaaaaaaaaa</p>',1,1),('4',1,'发射点·',1,'2015-02-11 19:04:23','风格豆腐干',1,1),('44A538E88C9A4CF0AD5FD942D22CC293',1,'打撒撒旦似的',1,'2016-04-24 11:32:54','<p>啊实打实大苏打实打实大苏打</p>',1,1),('46F258200D1941E79ACF6ECF8CC73646',1,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,'2016-05-11 17:21:31','<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>',1,1),('47C77174F57F4143922F83983E8FB63A',1,'aaasda',1,'2016-05-18 23:14:30','<p>sasdasdasd</p>',2,1),('5',1,'龟速达',1,'2015-02-11 19:04:23','恶趣味好看',1,2),('50445C6A920B41D0B486674C2EA9FB32',1,'adasda',1,'2016-06-04 13:55:21','<p>sdasda</p>',1,1),('5C3D81D1C681458782676AA87C5BF74D',1,'aaaaaaaaaaaaa',1,'2016-05-12 09:34:12','<p>aaaaaaaaaaaaaaaaa</p>',2,1),('6',1,'体改委',1,'2015-02-11 19:04:23','风格化风格化',1,3),('7',2,'特瑞',1,'2015-02-11 19:04:23','ghjrft',1,3),('7E509573D51349E09FB1DC6A1806FF7B',1,'aaaaaaaaa',1,'2016-06-03 13:56:35','<p>aaaaaaaaaaaaaaa</p>',1,1),('8',2,'认为',1,'2015-02-11 19:04:23','回复光滑',1,2),('81360B3E2E1945658C427EF5EC337C68',1,'aaaaaaaaaaaaaaaaaaaaaaaaaa',1,'2016-05-12 09:15:18','<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>',1,1),('89497DFE36694112908043A4BE811658',1,'aaaaaaaaaa',1,'2016-05-11 17:24:00','<p>aaaaaaaaaaaaaaaaaaaaaaaaaaa</p>',1,1),('8F50EDB0374F4F26AAAAEEA15D010B4E',1,'aaaaaaaaaaaaaaaaaaa',1,'2016-05-12 09:03:08','<p>aaaaaaaaaaaaaaaaaaaa</p>',1,1),('9',2,'魏汝稳',1,'2015-02-11 19:04:23','要提高警惕',1,2),('90CBD71B7AA24431B77877D96A43B335',1,'克里斯；大卡司；',1,'2016-04-24 18:27:12','<p>啊实打实大苏打上撒旦的视察三峡查杀<img src=\"http://img.baidu.com/hi/jx2/j_0068.gif\"/>啊实打实的<img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/></p>',1,1),('95CA614B3828459C93B8D6DDB13CFFEA',1,'aaaaaaa',1,'2016-05-11 17:17:49','<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>',1,1),('AA290B3DCE964C1D9625A552B6A38D5D',1,'实际道路喀什角动量看',3,'2016-04-24 18:39:56','<p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>啊少插手插手查收asda是<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>啊实打实大苏打啥的支持<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/>啊实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p>',13,8),('B28DA4A6389044B69136127EBBE12B34',2,'撒大苏打',1,'2016-05-14 19:45:13','<p>大三大四</p>',1,2),('BDDC5F51B8A54A838FB075D28694BAB2',1,'aaaaaaa',1,'2016-05-19 20:06:47','<p>ssssss</p><p><img src=\"/bar1.0/image/upload/20160519/1463659601790010594.png\" title=\"1463659601790010594.png\" alt=\"吧务后台-1.png\"/></p>',1,1),('BE1245BEB9D24CAD8D1874C0AC0AAE9E',1,'aadas',1,'2016-06-04 14:05:27','<p>dasdasd</p>',8,1),('BF671E5D5334404B92FF91F575976997',1,'的黑猫股份',1,'2016-04-24 17:39:05','<p>大苏打实打实大<img src=\"http://img.baidu.com/hi/jx2/j_0028.gif\" style=\"white-space: normal;\"/>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊呈持续性惺惺惜惺惺惺惺惜惺惺惺惺惜惺惺<img src=\"http://img.baidu.com/hi/jx2/j_0006.gif\" style=\"white-space: normal;\"/>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊顶顶顶顶顶顶顶顶顶顶顶顶<img src=\"http://img.baidu.com/hi/jx2/j_0067.gif\" style=\"white-space: normal;\"/>顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶<img src=\"http://img.baidu.com/hi/jx2/j_0051.gif\" style=\"white-space: normal;\"/></p>',1,1),('C3243159FA734A218A252395ACF56752',1,'ddddddddddddd',1,'2016-05-11 17:37:51','<p>dddddddddddddddddddddddd</p>',1,1),('D85C04F576994D879A9B5160471EBC90',1,'aaaaaaaaaaa',1,'2016-05-12 09:00:54','<p>aaaaaaaaaaaaaaaaaaaaaa</p>',1,1),('D8BCEFBD01FB4687840A7F4B6BFD7879',2,'啊实打实大苏打上',1,'2016-05-14 19:45:35','<p><img src=\"http://img.baidu.com/hi/jx2/j_0049.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0009.gif\"/></p>',1,2),('EA88AEA1FBB341A09E32CAA2447C3C60',1,'顶顶顶顶顶顶顶顶顶顶顶顶顶顶',1,'2016-05-12 08:37:16','<p>啊啊啊啊啊啊啊啊啊啊啊</p>',2,2),('F1BA213700DB427DB3A72BF48BE39CF2',8,'aaaaaaaaaaaa',1,'2016-05-14 21:21:19','<p>aaaaaaaaaaaaaaaaaaaaa</p>',1,8),('FDEC508CFADD418CB91DB801618A8FCE',1,'asda',1,'2016-05-30 22:25:23','<p><img src=\"/bar1.0/image/upload/20160530/1464618321115052146.png\" title=\"1464618321115052146.png\" alt=\"吧务后台-1.png\"/></p>',1,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postlog`
--

DROP TABLE IF EXISTS `postlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postlog` (
  `firstOperation` varchar(255) DEFAULT NULL,
  `firstOperator` int(11) DEFAULT NULL,
  `firstTime` datetime DEFAULT NULL,
  `lastOperation` varchar(255) DEFAULT NULL,
  `lastOperator` int(11) DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `appealUser` int(11) DEFAULT NULL,
  `appealTime` datetime DEFAULT NULL,
  `appealProcess` tinyint(1) DEFAULT NULL,
  `appealContent` text,
  PRIMARY KEY (`id`),
  KEY `FKbcler2s9fhlarbndo5o72uh4l` (`pid`),
  KEY `FK9n67r1fghgf856lv71shfnveq` (`firstOperator`),
  KEY `FKfn2wwijo3b1vfrypl40p4r1xt` (`lastOperator`),
  KEY `FKmty5dvfyh57xl1u4rm0fy5x29` (`appealUser`),
  CONSTRAINT `FK9n67r1fghgf856lv71shfnveq` FOREIGN KEY (`firstOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKbcler2s9fhlarbndo5o72uh4l` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `FKfn2wwijo3b1vfrypl40p4r1xt` FOREIGN KEY (`lastOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKmty5dvfyh57xl1u4rm0fy5x29` FOREIGN KEY (`appealUser`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_postlog_appealUser_TO_user` FOREIGN KEY (`appealUser`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_postlog_firstOperator_TO_user` FOREIGN KEY (`firstOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_postlog_lastOperator_TO_user` FOREIGN KEY (`lastOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_postlog_TOpost` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postlog`
--

LOCK TABLES `postlog` WRITE;
/*!40000 ALTER TABLE `postlog` DISABLE KEYS */;
INSERT INTO `postlog` VALUES ('delete',1,'2016-06-05 16:03:19','recover',1,'2016-06-05 16:05:22','402881e9551f859601551f966c3600ed','BE1245BEB9D24CAD8D1874C0AC0AAE9E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:22','recover',1,'2016-06-05 16:03:55','402881e9551f859601551f96777100ef','50445C6A920B41D0B486674C2EA9FB32',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:25','recover',1,'2016-06-05 16:05:22','402881e9551f859601551f9681e400f1','7E509573D51349E09FB1DC6A1806FF7B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:28','recover',1,'2016-06-05 16:03:55','402881e9551f859601551f968ce300f3','36C44D6936F844598120F3852CAF6EA9',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:30','recover',1,'2016-06-05 16:03:55','402881e9551f859601551f96971700f5','FDEC508CFADD418CB91DB801618A8FCE',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:33','recover',1,'2016-06-05 16:03:55','402881e9551f859601551f96a1cc00f7','BDDC5F51B8A54A838FB075D28694BAB2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:36','recover',1,'2016-06-05 16:05:22','402881e9551f859601551f96aec100f9','47C77174F57F4143922F83983E8FB63A',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:03:39','recover',1,'2016-06-05 16:03:55','402881e9551f859601551f96ba0700fb','F1BA213700DB427DB3A72BF48BE39CF2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:13','recover',1,'2016-06-05 16:32:48','402881e9551f97e001551fa5e31b0000','BE1245BEB9D24CAD8D1874C0AC0AAE9E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:15','recover',1,'2016-06-05 16:32:48','402881e9551f97e001551fa5ed610001','50445C6A920B41D0B486674C2EA9FB32',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:18','recover',1,'2016-06-05 16:32:48','402881e9551f97e001551fa5f8170002','7E509573D51349E09FB1DC6A1806FF7B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:21','recover',1,'2016-06-05 16:32:48','402881e9551f97e001551fa603f10003','36C44D6936F844598120F3852CAF6EA9',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:25','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa612370004','FDEC508CFADD418CB91DB801618A8FCE',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:28','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa61d120005','BDDC5F51B8A54A838FB075D28694BAB2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:31','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa629010006','47C77174F57F4143922F83983E8FB63A',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:33','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa633740007','F1BA213700DB427DB3A72BF48BE39CF2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:36','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa63f250008','D8BCEFBD01FB4687840A7F4B6BFD7879',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:39','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa649dc0009','B28DA4A6389044B69136127EBBE12B34',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:43','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa657cc000a','208E803F73BA465291E1C35E770B2A8B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:46','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa663bd000b','00FF18873E684DB4BC3D77B4BA2703AA',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:49','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa66ef1000c','5C3D81D1C681458782676AA87C5BF74D',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:51','recover',1,'2016-06-05 16:27:26','402881e9551f97e001551fa67a21000d','1835FF7F25F84D19B8C961E7050745E4',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:55','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6866e000e','81360B3E2E1945658C427EF5EC337C68',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:20:58','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa693b1000f','8F50EDB0374F4F26AAAAEEA15D010B4E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:01','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa69eaf0010','D85C04F576994D879A9B5160471EBC90',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:04','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6aba10011','3559179536FA48619727457422C2BC4C',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:07','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6b7b30012','EA88AEA1FBB341A09E32CAA2447C3C60',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:11','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6c5490013','C3243159FA734A218A252395ACF56752',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:14','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6d1990014','89497DFE36694112908043A4BE811658',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:17','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6de2e0015','46F258200D1941E79ACF6ECF8CC73646',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:21','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6ecf30016','95CA614B3828459C93B8D6DDB13CFFEA',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:21:25','recover',1,'2016-06-05 16:28:13','402881e9551f97e001551fa6fc2a0017','00BAD797EF024FCBAF27FEAE317920AD',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:01','recover',1,'2016-06-05 16:32:48','402881e9551f97e001551fafc6af0018','FDEC508CFADD418CB91DB801618A8FCE',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:04','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fafd1e90019','BDDC5F51B8A54A838FB075D28694BAB2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:07','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fafddbe001a','47C77174F57F4143922F83983E8FB63A',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:10','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fafead1001b','F1BA213700DB427DB3A72BF48BE39CF2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:13','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551faff6d8001c','D8BCEFBD01FB4687840A7F4B6BFD7879',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:16','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb00259001d','B28DA4A6389044B69136127EBBE12B34',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:19','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb00d3d001e','208E803F73BA465291E1C35E770B2A8B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:22','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb0184f001f','00FF18873E684DB4BC3D77B4BA2703AA',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:25','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb023550020','5C3D81D1C681458782676AA87C5BF74D',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:28','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb02fa90021','1835FF7F25F84D19B8C961E7050745E4',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:31:31','recover',1,'2016-06-05 16:31:43','402881e9551f97e001551fb03b960022','81360B3E2E1945658C427EF5EC337C68',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:33:59','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb27f040023','BE1245BEB9D24CAD8D1874C0AC0AAE9E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:03','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb28cb80024','50445C6A920B41D0B486674C2EA9FB32',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:05','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb2977c0025','7E509573D51349E09FB1DC6A1806FF7B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:08','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb2a25a0026','36C44D6936F844598120F3852CAF6EA9',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:11','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb2ac090027','FDEC508CFADD418CB91DB801618A8FCE',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:13','recover',1,'2016-06-05 16:36:04','402881e9551f97e001551fb2b6700028','BDDC5F51B8A54A838FB075D28694BAB2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:16','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2bfde0029','47C77174F57F4143922F83983E8FB63A',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:18','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2c985002a','F1BA213700DB427DB3A72BF48BE39CF2',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:21','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2d366002b','D8BCEFBD01FB4687840A7F4B6BFD7879',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:24','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2de8d002c','B28DA4A6389044B69136127EBBE12B34',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:26','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2e9dc002d','208E803F73BA465291E1C35E770B2A8B',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:30','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb2f5f4002e','00FF18873E684DB4BC3D77B4BA2703AA',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:32','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb3007a002f','5C3D81D1C681458782676AA87C5BF74D',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:35','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb30c0c0030','1835FF7F25F84D19B8C961E7050745E4',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:38','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb3183a0031','81360B3E2E1945658C427EF5EC337C68',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 16:34:41','recover',1,'2016-06-05 16:34:57','402881e9551f97e001551fb3233b0032','8F50EDB0374F4F26AAAAEEA15D010B4E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-05 17:09:24','recover',1,'2016-06-05 17:09:44','402881e9551f97e001551fd2eaa60033','BE1245BEB9D24CAD8D1874C0AC0AAE9E',NULL,NULL,NULL,NULL),('delete',1,'2016-06-06 20:00:09','recover',1,'2016-06-06 20:20:58','402881e9552594f4015525959b950000','BE1245BEB9D24CAD8D1874C0AC0AAE9E',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `postlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postoperationlog`
--

DROP TABLE IF EXISTS `postoperationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postoperationlog` (
  `id` varchar(255) NOT NULL,
  `postlogId` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `operator` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK44jlvxnlgn9lnjftc6gaiicy5` (`operator`),
  KEY `FK120lfvdfg38h6dru7p93q4994` (`postlogId`),
  CONSTRAINT `FK120lfvdfg38h6dru7p93q4994` FOREIGN KEY (`postlogId`) REFERENCES `postlog` (`id`),
  CONSTRAINT `FK44jlvxnlgn9lnjftc6gaiicy5` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_postoperationlog` FOREIGN KEY (`postlogId`) REFERENCES `postlog` (`id`),
  CONSTRAINT `FK_postoperationlog_TO_user` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postoperationlog`
--

LOCK TABLES `postoperationlog` WRITE;
/*!40000 ALTER TABLE `postoperationlog` DISABLE KEYS */;
INSERT INTO `postoperationlog` VALUES ('402881e9551f859601551f966c3700ee','402881e9551f859601551f966c3600ed','delete',1,'2016-06-05 16:03:19'),('402881e9551f859601551f96777200f0','402881e9551f859601551f96777100ef','delete',1,'2016-06-05 16:03:22'),('402881e9551f859601551f9681e600f2','402881e9551f859601551f9681e400f1','delete',1,'2016-06-05 16:03:25'),('402881e9551f859601551f968ce400f4','402881e9551f859601551f968ce300f3','delete',1,'2016-06-05 16:03:28'),('402881e9551f859601551f96971800f6','402881e9551f859601551f96971700f5','delete',1,'2016-06-05 16:03:30'),('402881e9551f859601551f96a1cd00f8','402881e9551f859601551f96a1cc00f7','delete',1,'2016-06-05 16:03:33'),('402881e9551f859601551f96aec100fa','402881e9551f859601551f96aec100f9','delete',1,'2016-06-05 16:03:36'),('402881e9551f859601551f96ba0900fc','402881e9551f859601551f96ba0700fb','delete',1,'2016-06-05 16:03:39'),('402881e9551f859601551f96f64e00fd','402881e9551f859601551f96ba0700fb','recover',1,'2016-06-05 16:03:55'),('402881e9551f859601551f96f66600ff','402881e9551f859601551f96a1cc00f7','recover',1,'2016-06-05 16:03:55'),('402881e9551f859601551f96f6920100','402881e9551f859601551f96777100ef','recover',1,'2016-06-05 16:03:55'),('402881e9551f859601551f96f6a70102','402881e9551f859601551f968ce300f3','recover',1,'2016-06-05 16:03:55'),('402881e9551f859601551f96f6ba0104','402881e9551f859601551f96971700f5','recover',1,'2016-06-05 16:03:55');
/*!40000 ALTER TABLE `postoperationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,NULL,NULL);
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FK1kh7w9mmqw0cgouxa0yauyu1c` (`uid`),
  KEY `FKs8nsga6cb8yrci901bqnd1ho6` (`fid`),
  CONSTRAINT `FK1kh7w9mmqw0cgouxa0yauyu1c` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKs8nsga6cb8yrci901bqnd1ho6` FOREIGN KEY (`fid`) REFERENCES `floor` (`fid`),
  CONSTRAINT `FK_reply_floor` FOREIGN KEY (`fid`) REFERENCES `floor` (`fid`),
  CONSTRAINT `FK_reply_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'asda大卫杜夫让他已经','2015-02-11 10:04:23',1,2),(2,'asda','2015-02-11 10:04:23',2,3),(3,'问起我','2015-02-11 10:04:23',3,2),(4,'额外服务','2015-02-11 10:04:23',1,2),(5,'亲吻','2015-02-11 10:04:23',2,5),(6,'撒旦水水水水水水水水水水','2015-02-11 10:04:23',2,17),(7,'啊啊啊啊啊啊啊啊','2016-05-05 18:41:23',1,17),(8,'阿斯顿','2016-05-05 18:41:42',1,17),(9,'啊啊啊啊啊啊啊','2016-05-05 18:41:48',1,17),(10,'强强强强强强强强','2016-05-05 18:41:52',1,17),(11,'顶顶顶顶顶顶顶顶2','2016-05-05 18:41:56',1,17),(12,'111111111111','2016-05-05 18:41:59',1,17),(13,'33333333333','2016-05-05 18:42:02',1,17),(14,'6666666666','2016-05-05 18:42:06',1,17),(15,'1111111111111','2016-05-05 18:42:09',1,17),(16,'111111111111111111','2016-05-05 18:42:15',1,17),(17,'撒啊啊啊啊啊啊啊啊2','2016-05-05 18:47:50',1,18),(18,'检查了时间到啦\n','2016-05-06 20:19:13',1,17),(19,'ddddddddddddd','2016-05-14 19:35:11',8,43),(20,'asdasdascas','2016-06-04 19:57:49',1,58),(21,'回复 啊啊啊:asdasdasda','2016-06-04 19:57:57',1,58),(22,'asdasd','2016-06-05 12:45:15',1,65),(23,'aaaaaaaaa','2016-06-05 12:55:33',1,39),(24,'aasdas','2016-06-05 12:55:49',1,39),(25,'aasdas','2016-06-05 12:55:54',1,39),(26,'aaaaaaaa','2016-06-05 12:59:37',1,39),(27,'sadasdaasdasasda\'s','2016-06-05 13:00:51',1,39),(28,'大量时间','2016-06-05 13:02:38',1,39),(29,'asda撒旦撒旦','2016-06-05 13:02:43',1,39),(30,'哒asda是','2016-06-05 13:02:48',1,39),(31,'啊实打实大苏打','2016-06-05 13:02:54',1,39),(32,'啊实打实的','2016-06-05 13:02:58',1,39),(33,'asda大','2016-06-05 13:03:02',1,39),(34,'asda是','2016-06-05 13:04:00',1,39);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'默认'),(2,'删除'),(3,'加精');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT 'icons/default.png',
  `email` varchar(255) DEFAULT NULL,
  `lid` int(11) DEFAULT '1',
  `delete_post_num` int(11) DEFAULT '0',
  `post_num` int(11) DEFAULT '0',
  `floor_num` int(11) DEFAULT '0',
  `regist_date` datetime DEFAULT NULL,
  `boutique_num` int(11) DEFAULT '0',
  `isAdmin` tinyint(1) DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `forbidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`),
  KEY `FK466avr74q3d31dsmycukgwphc` (`lid`),
  KEY `FKlyjpeifd600hifrxw2avv3vvv` (`position`),
  CONSTRAINT `FK466avr74q3d31dsmycukgwphc` FOREIGN KEY (`lid`) REFERENCES `level` (`lid`),
  CONSTRAINT `FKlyjpeifd600hifrxw2avv3vvv` FOREIGN KEY (`position`) REFERENCES `position` (`position_id`),
  CONSTRAINT `FK_user_level` FOREIGN KEY (`lid`) REFERENCES `level` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','啊啊啊','icons/1.jpg','xxxx@qq.com',1,266,15,12,NULL,1,1,1,0),(2,'admin1','admin1','12312asda','icons/1.png',NULL,1,3,3,2,'2016-04-24 00:00:00',0,1,2,0),(3,'admina','admin','a','icons/2.png','xiedacon@qq.com',1,0,0,0,'2016-04-24 00:00:00',0,1,5,0),(4,'aaaaaa','aaaaaa','aaa','icons/default.png','xiedacon@qq.com',1,0,0,0,'2016-05-24 00:00:00',0,1,3,0),(5,'adminaa','admin','admin','icons/default.png','xiedacon@qq.com',1,0,0,0,'2016-04-30 00:00:00',0,0,NULL,0),(6,'admina','admin','a','icons/2.png','xiedacon@qq.com',1,0,0,0,'2016-04-24 00:00:00',0,0,NULL,0),(8,'bbbbb','bbbbb','asdla','icons/default.png','xiedacon@qq.com',1,0,2,1,'2016-05-14 00:00:00',0,1,4,0),(9,'admin2','admin','a','icons/default.png','xiedacon@qq.com',1,0,0,0,'2016-06-03 11:42:00',0,0,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `uid` int(11) DEFAULT NULL,
  `firstOperation` varchar(255) DEFAULT NULL,
  `firstOperator` int(11) DEFAULT NULL,
  `firstTime` datetime DEFAULT NULL,
  `lastOperation` varchar(255) DEFAULT NULL,
  `lastOperator` int(11) DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appealTime` datetime DEFAULT NULL,
  `appealContent` text,
  `appealProcess` tinyint(1) DEFAULT NULL,
  `forbiddenTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK44wcntko8kcmsbjvd3h3k4wpr` (`uid`),
  KEY `FK6xfkgalmrmsn8jjtxjj2yrdx2` (`firstOperator`),
  KEY `FKs8vtr1yq92fnumqh4b5mxse3a` (`lastOperator`),
  CONSTRAINT `FK44wcntko8kcmsbjvd3h3k4wpr` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK6xfkgalmrmsn8jjtxjj2yrdx2` FOREIGN KEY (`firstOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKs8vtr1yq92fnumqh4b5mxse3a` FOREIGN KEY (`lastOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_userlog_firstOperator_TO_user` FOREIGN KEY (`firstOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_userlog_lastOperator_TO_user` FOREIGN KEY (`lastOperator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_userlog_uid_TO_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES (5,'forbidden',1,'2016-05-12 19:06:43','removeForbidden',1,'2016-05-12 19:55:17',2,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-05-12 19:56:46','removeForbidden',1,'2016-05-12 19:56:50',3,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-05-12 20:18:46','removeForbidden',1,'2016-05-12 20:18:53',4,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-05-12 20:20:02','removeForbidden',1,'2016-06-07 11:47:00',5,NULL,NULL,NULL,NULL),(4,'forbidden',8,'2016-05-14 21:22:57','removeForbidden',8,'2016-05-14 21:23:16',7,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-05-18 23:15:52','removeForbidden',1,'2016-05-18 23:16:07',8,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-06 21:46:31','removeForbidden',1,'2016-06-07 11:47:02',9,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-06 22:22:40','removeForbidden',1,'2016-06-07 11:47:41',10,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-07 10:16:30','removeForbidden',1,'2016-06-07 11:47:41',11,NULL,NULL,NULL,NULL),(2,'forbidden',1,'2016-06-07 10:25:25','removeForbidden',1,'2016-06-07 11:47:41',12,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-07 10:25:30','removeForbidden',1,'2016-06-07 11:47:41',13,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-07 10:25:32','removeForbidden',1,'2016-06-07 11:47:41',14,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-07 11:47:58','removeForbidden',1,'2016-06-08 09:07:26',15,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-07 11:48:00','removeForbidden',1,'2016-06-08 09:07:26',16,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-08 09:03:57','removeForbidden',1,'2016-06-08 09:04:02',17,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:08:29','removeForbidden',1,'2016-06-08 09:12:56',18,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:11:10','removeForbidden',1,'2016-06-08 09:12:56',19,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:12:07','removeForbidden',1,'2016-06-08 09:12:56',20,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:12:39','removeForbidden',1,'2016-06-08 09:12:56',21,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:13:02','removeForbidden',1,'2016-06-08 09:15:20',22,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:13:40','removeForbidden',1,'2016-06-08 09:15:20',23,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:15:46','removeForbidden',1,'2016-06-08 09:16:07',24,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:15:58','removeForbidden',1,'2016-06-08 09:16:07',25,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:16:01','removeForbidden',1,'2016-06-08 09:16:07',26,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:19:09','removeForbidden',1,'2016-06-08 09:19:15',27,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:19:10','removeForbidden',1,'2016-06-08 09:19:14',28,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:20:32','removeForbidden',1,'2016-06-08 09:21:38',29,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:20:33','removeForbidden',1,'2016-06-08 09:21:38',30,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:20:34','removeForbidden',1,'2016-06-08 09:21:38',31,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:23:52','removeForbidden',1,'2016-06-08 09:24:17',32,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:23:53','removeForbidden',1,'2016-06-08 09:24:17',33,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:23:55','removeForbidden',1,'2016-06-08 09:24:17',34,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:23:56','removeForbidden',1,'2016-06-08 09:24:17',35,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:24:34','removeForbidden',1,'2016-06-08 09:25:05',36,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:24:35','removeForbidden',1,'2016-06-08 09:25:05',37,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:24:36','removeForbidden',1,'2016-06-08 09:25:05',38,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:24:36','removeForbidden',1,'2016-06-08 09:25:05',39,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:25:18','removeForbidden',1,'2016-06-08 09:25:33',40,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:25:19','removeForbidden',1,'2016-06-08 09:25:31',41,NULL,NULL,NULL,NULL),(2,'forbidden',1,'2016-06-08 09:25:21','removeForbidden',1,'2016-06-08 09:25:31',42,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-08 09:25:22','removeForbidden',1,'2016-06-08 09:25:31',43,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:25:24','removeForbidden',1,'2016-06-08 09:25:31',44,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:25:24','removeForbidden',1,'2016-06-08 09:25:31',45,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:25:25','removeForbidden',1,'2016-06-08 09:25:31',46,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:26:25','removeForbidden',1,'2016-06-08 09:26:38',47,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:26:27','removeForbidden',1,'2016-06-08 09:26:37',48,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:26:27','removeForbidden',1,'2016-06-08 09:26:37',49,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:26:28','removeForbidden',1,'2016-06-08 09:26:36',50,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:26:28','removeForbidden',1,'2016-06-08 09:26:36',51,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-08 09:26:29','removeForbidden',1,'2016-06-08 09:26:34',52,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:27:35','removeForbidden',1,'2016-06-08 09:27:43',53,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:27:36','removeForbidden',1,'2016-06-08 09:27:43',54,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:27:37','removeForbidden',1,'2016-06-08 09:27:42',55,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:27:37','removeForbidden',1,'2016-06-08 09:27:42',56,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:29:34','removeForbidden',1,'2016-06-08 09:29:40',57,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:29:35','removeForbidden',1,'2016-06-08 09:29:40',58,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:29:36','removeForbidden',1,'2016-06-08 09:29:40',59,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:29:50','removeForbidden',1,'2016-06-08 09:29:55',60,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:29:51','removeForbidden',1,'2016-06-08 09:29:55',61,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:31:46','removeForbidden',1,'2016-06-08 09:31:58',62,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:31:47','removeForbidden',1,'2016-06-08 09:31:58',63,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:31:48','removeForbidden',1,'2016-06-08 09:31:58',64,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:33:35','removeForbidden',1,'2016-06-08 09:33:50',65,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:33:37','removeForbidden',1,'2016-06-08 09:33:50',66,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:33:38','removeForbidden',1,'2016-06-08 09:33:50',67,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:33:38','removeForbidden',1,'2016-06-08 09:33:50',68,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:34:04','removeForbidden',1,'2016-06-08 09:34:11',69,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-08 09:34:05','removeForbidden',1,'2016-06-08 09:34:11',70,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:34:06','removeForbidden',1,'2016-06-08 09:34:11',71,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:34:06','removeForbidden',1,'2016-06-08 09:34:11',72,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:37:20','removeForbidden',1,'2016-06-08 09:37:27',73,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:37:21','removeForbidden',1,'2016-06-08 09:37:27',74,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:37:22','removeForbidden',1,'2016-06-08 09:37:27',75,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:37:23','removeForbidden',1,'2016-06-08 09:37:27',76,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:38:53','removeForbidden',1,'2016-06-08 09:39:03',77,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:38:55','removeForbidden',1,'2016-06-08 09:39:03',78,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:38:56','removeForbidden',1,'2016-06-08 09:39:03',79,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:38:56','removeForbidden',1,'2016-06-08 09:39:03',80,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:51:02','removeForbidden',1,'2016-06-08 09:51:08',81,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:51:03','removeForbidden',1,'2016-06-08 09:51:08',82,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:51:04','removeForbidden',1,'2016-06-08 09:51:08',83,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:51:18','removeForbidden',1,'2016-06-08 09:51:24',84,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:51:20','removeForbidden',1,'2016-06-08 09:51:24',85,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:51:20','removeForbidden',1,'2016-06-08 09:51:24',86,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:52:10','removeForbidden',1,'2016-06-08 09:52:23',87,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:52:11','removeForbidden',1,'2016-06-08 09:52:23',88,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:52:12','removeForbidden',1,'2016-06-08 09:52:23',89,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:52:13','removeForbidden',1,'2016-06-08 09:52:23',90,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:52:28','removeForbidden',1,'2016-06-08 09:52:38',91,NULL,NULL,NULL,NULL),(8,'forbidden',1,'2016-06-08 09:52:29','removeForbidden',1,'2016-06-08 09:52:38',92,NULL,NULL,NULL,NULL),(5,'forbidden',1,'2016-06-08 09:52:30','removeForbidden',1,'2016-06-08 09:52:38',93,NULL,NULL,NULL,NULL),(3,'forbidden',1,'2016-06-08 09:52:31','removeForbidden',1,'2016-06-08 09:52:38',94,NULL,NULL,NULL,NULL),(4,'forbidden',1,'2016-06-08 09:52:32','removeForbidden',1,'2016-06-08 09:52:38',95,NULL,NULL,NULL,NULL),(6,'forbidden',1,'2016-06-08 09:52:32','removeForbidden',1,'2016-06-08 09:52:38',96,NULL,NULL,NULL,NULL),(2,'forbidden',1,'2016-06-08 09:52:33','removeForbidden',1,'2016-06-08 09:52:38',97,NULL,NULL,NULL,NULL),(9,'forbidden',1,'2016-06-08 09:52:54','removeForbidden',1,'2016-06-08 09:52:58',98,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useroperationlog`
--

DROP TABLE IF EXISTS `useroperationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useroperationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` int(11) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userlogId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcc4ptwvc9lrya6hkkxu5f4ovv` (`userlogId`),
  KEY `FK4ip08xepct8mirbiy15ojpqv` (`operator`),
  CONSTRAINT `FK4ip08xepct8mirbiy15ojpqv` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FKcc4ptwvc9lrya6hkkxu5f4ovv` FOREIGN KEY (`userlogId`) REFERENCES `userlog` (`id`),
  CONSTRAINT `FK_useroperationlog_TO_user` FOREIGN KEY (`operator`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_useroperationlog_userLogId_TO_userlog` FOREIGN KEY (`userLogId`) REFERENCES `userlog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useroperationlog`
--

LOCK TABLES `useroperationlog` WRITE;
/*!40000 ALTER TABLE `useroperationlog` DISABLE KEYS */;
INSERT INTO `useroperationlog` VALUES (2,1,'forbidden','2016-05-12 19:06:43',2),(5,1,'removeForbidden','2016-05-12 19:55:17',2),(6,1,'forbidden','2016-05-12 19:56:46',3),(7,1,'removeForbidden','2016-05-12 19:56:50',3),(8,1,'forbidden','2016-05-12 20:18:46',4),(9,1,'removeForbidden','2016-05-12 20:18:53',4),(10,1,'forbidden','2016-05-12 20:20:02',5),(13,8,'forbidden','2016-05-14 21:22:57',7),(14,8,'removeForbidden','2016-05-14 21:23:16',7),(15,1,'forbidden','2016-05-18 23:15:52',8),(16,1,'removeForbidden','2016-05-18 23:16:07',8),(17,1,'forbidden','2016-06-06 21:46:31',9),(18,1,'forbidden','2016-06-06 22:22:40',10),(19,1,'forbidden','2016-06-07 10:16:30',11),(20,1,'forbidden','2016-06-07 10:25:25',12),(21,1,'forbidden','2016-06-07 10:25:30',13),(22,1,'forbidden','2016-06-07 10:25:32',14);
/*!40000 ALTER TABLE `useroperationlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 14:12:42
