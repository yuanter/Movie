-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `cinema_id` bigint NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(20) DEFAULT NULL,
  `cinema_address` varchar(45) DEFAULT NULL,
  `cinema_webAddress` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'中山奇幻电影院','昆明市五华区吾悦广场4楼',''),(2,'翠园国际影城','昆明市五华区虹山东路9号版筑翠园小区9幢3-4楼或建设路53-1号','http://dianying.nuomi.com/cinema/cinemadetail?cinemaId=3866&cid=aldcinema&from=alading&tid=pc_dianying_aldcinema'),(3,'中影凯锐特影城','云南省昆明市五华区海源寺慧谷路2号春城慧谷二期3层8号','http://dianying.nuomi.com/cinema/cinemadetail?cinemaId=13144&cid=aldcinema&from=alading&tid=pc_dianying_aldcinema'),(4,'横店电影城(五华店)','海园北路昆百大国际派3栋4楼','http://www.dianping.com/shop/69230014'),(5,'新建设电影世界','昆明市文林街93号（东风西路与文林街交口处）','http://theater.mtime.com/China_Yunnan_Province_Kunming_Wuhuaqu/1355/');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `comment_content` text,
  `movie_id` bigint NOT NULL,
  `comment_time` date DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `usr_comm` (`user_id`),
  KEY `mv_comm` (`movie_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'真的太好看了。',4,'2020-06-09'),(3,1,'真的好看，一点不假。\n',11,'2020-06-10');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hall` (
  `hall_id` bigint NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(20) DEFAULT NULL,
  `hall_capacity` int DEFAULT NULL,
  `cinema_id` bigint NOT NULL,
  PRIMARY KEY (`hall_id`),
  KEY `cn_hall` (`cinema_id`),
  CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,'普通厅',80,1),(2,'普通厅',80,2),(3,'IMAX厅',150,3),(4,'AK厅',120,4);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` bigint NOT NULL AUTO_INCREMENT,
  `movie_cn_name` varchar(30) DEFAULT NULL,
  `movie_fg_name` varchar(100) DEFAULT NULL,
  `movie_actor` varchar(1000) DEFAULT NULL,
  `movie_director` varchar(30) DEFAULT NULL,
  `movie_detail` text,
  `movie_duration` varchar(100) DEFAULT NULL,
  `movie_type` varchar(10) DEFAULT NULL,
  `movie_score` float DEFAULT NULL,
  `movie_boxOffice` float DEFAULT NULL,
  `movie_commentCount` bigint DEFAULT NULL,
  `movie_releaseDate` date DEFAULT NULL,
  `movie_country` varchar(10) DEFAULT NULL,
  `movie_picture` varchar(100) DEFAULT NULL,
  `movie_state` int DEFAULT '1',
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'僵尸先生','Mr. Vampire','林正英:九叔','刘观伟','富贵人家任老爷因于其父葬之时受风水先生吩咐，于二十年后必须起棺迁葬，故找当地茅山师父九叔助办此事。起棺当日，发现任老太爷之墓地为蜻蜓点水穴，其尸于二十年来毫无腐化迹象。致令九叔生疑，遂将棺木运至其住之义庄。后来任老太爷之尸体变成僵尸，更将任老爷杀死，九叔认为婷婷处境危险，而接进其家住。九叔两徒弟文才，秋生倾慕婷婷，亦因此而与婷之表哥起争执。一晚，文才为保护婷而被僵尸所伤，中了尸毒，以致慢慢变成僵尸，幸尸毒可被糯米所解，但文才食以用来除尸毒之糯米含其他杂米，故无效。另一方面，秋生亦被女鬼小玉所迷，幸后被九叔解救，而九叔亦发现糯米中有杂米，遂将糯米选出煲成糯米粥，救了文才。由于僵尸接二连三地杀人，引起群情汹涌，于是治安队长、九叔、文才、秋生及婷婷合力，决将僵尸消灭。','96分钟','惊悚',5.5,1987.5,25655,'2020-06-02','中国香港','../upload/movies/7871aac8e93f432084cc8fc1e5a5b910.jpg',1),(2,'阿郎的故事','All About Ah-Long','周润发:阿郎','杜琪峰','阿郎（周润发饰）是一个出色的赛车手和放荡不羁的浪子。他的女友波波（张艾嘉饰）对他一往情深，无视他的缺点，并不顾母亲的反对和他结了婚。婚后，阿郎依然故我，甚至出手殴打已经怀孕的妻子，在妻子临盆之际，他依然去参加非法赛车，结果因比赛中撞死警察而被捕入狱。波波的母亲串通医生谎报婴儿夭折，带波波去了美国。阿郎出狱后，面对妻离子散的结局无比追悔。他从孤儿院领回了儿子波仔（黄坤玄饰），靠开货车抚养孩子。十年后，阿郎陪波仔参加一项单车比赛，恰好比赛是由波波为美国一家时装公司推销童装而举办的，夫妻相见，无言以对。后波波得知波仔是自己的儿子后，想带走波仔。阿郎为争回波仔及表达复婚决心，执意参加了即将举行的车赛，不想，旧病复发，人车蹈入火海。','117分钟','剧情',6.5,386.405,124545,'2020-06-02','中国大陆','../upload/movies/2400dfe083214296a47b570b82dba756.jpg',0),(3,'六月的秘密','The Secret of June','郭富城:Chavles Bao,苗苗:小珺','王暘','Chavles Bao（郭富城饰）和小珺（苗苗饰）在唐人街一起生活，相依为命，天才大提琴手小珺在追逐梦想的过程中意外发现自己的身世谜团，牵扯出二十年前错综复杂的案件，身边的每个人都牵涉其中，每个人都有着不能说的秘密，而逐渐浮出水面的真相远比美丽的谎言更让她纠结万分。','120分钟','剧情',5.6,576.3,4545777,'2020-06-02','大陆','../upload/movies/7fbc96d9b84d470cbc4d6d09a9c9d706.jpg',0),(4,'X战警：黑凤凰',' X-Men: Dark Phoenix','苏菲·特纳:琴·葛蕾,詹姆斯·麦卡沃伊:x教授','西蒙·金伯格','琴·葛蕾（索菲·特纳饰）意外吸收了来自太空的宇宙能量，不仅没死，反而变得更加强大，接着琴·葛蕾一路发现自己身世的真相，失控之后，让跟着那股宇宙能量来到地球的外星人有机可乘。为了拿回那股宇宙能量，外星人领导Vuk（杰西卡·查斯坦饰）抓着琴·葛蕾的“身份认同”问题，挑拨她与X战警间的矛盾 [4]  。随着琴·葛蕾的失控，面对“毁灭黑凤凰”还是“拯救琴·葛蕾”的艰难抉择，X战警分崩离析，走向分裂。为了对抗这位黑化的昔日挚友、同时也是宇宙最强的变种人，他们不得不拼尽全力，迎接这场没有胜者的战争','113分钟','科幻',8.8,1000000,7575758,'2020-06-02','美国','../upload/movies/952f7aec82cd4d46a8b1c2e13a5e4fe3.jpg',1),(5,'九龙不败','The Invincible Dragon','张晋:九龙,安德森·席尔瓦:冼力山','陈果','作为叱咤香港警界的精英干探，九龙（张晋饰）查案方式奇异狠辣却屡建奇功，被视作“警界狂人”。唯独面对这桩妙龄女警连环凶杀案，他用尽手段仍毫无线索，更令他抓狂的是，他的警花未婚妻方宁（邓丽欣饰）竟然也在抓捕行动中意外失踪。\n在爱与痛的边缘挣扎的九龙，突然发现女警连环遇害只是第一步，凶手其实还有着更加血腥的阴谋。在好友王梦奇医师（刘心悠饰）及拳王冼力山（安德森·席尔瓦饰）的协助下，九龙与澳门警司（郑嘉颖饰）联手向罪犯出击','100分钟','剧情',8.7,1805.41,75744,'2020-06-02','中国大陆','../upload/movies/c67e24470c1a4b81a30634b58338bfce.jpg',1),(6,'你好，之华','Last Letter','周迅:袁之华,杜江:周文涛,秦昊:尹川','岩井俊二','袁之华（周迅饰）代替去世的姐姐之南参加初\n电影海报\n电影海报(7张)\n中同学会，遇见了彼时倾慕的学长尹川（秦昊饰）。阴错阳差地，之华开始透过没留地址的书信重拾失落的年少岁月，向尹川倾诉心事。另一厢，收到信的尹川把回信寄往之南的老家，被之南女儿睦睦收到。睦睦也以之南的名义回信，希望探寻母亲的青春时代。一连串错位的倾诉与追忆，尘封往事在字里行间慢慢苏醒，渐渐揭开了两姐妹、三世代之间交相缠绕的故事.','114分钟','爱情',6.2,NULL,NULL,'2020-06-02','中国大陆','../upload/movies/7cf1b66c69c34032a07d0a63d32762b1.jpg',0),(7,'八子','ADVANCE WAVE UPON WAVE','刘端端:满崽,邵兵:大牛','高希希','上世纪30年代的赣南地区，在这个被称为中国革命“红色摇篮”的地方，曾经有这样一位母亲，她将八个儿子先后送入红军，奔赴战场前线。但战火无情，兄弟中的六人陆续牺牲，只剩下大哥杨大牛和最小的孩子满崽。满崽找到了大牛的部队，成了哥哥麾下的普通一兵，经过一场场战役的淬炼，新兵满崽迅速成长为一个真正的战士。最后的战斗打响了，为了掩护大部队安全撤离，杨大牛带领弟弟满崽和全体战友浴血肉搏，直至弹尽粮绝。\n英雄的身前，是枪林弹雨的沙场，而在英雄的身后，家乡的村庄依然宁静安详，微风吹过金黄的稻浪簌簌作响，一位年迈的母亲正在村头的小路旁孤独的守望。','117分钟','动作',6.1,NULL,NULL,'2020-06-02','中国大陆','../upload/movies/c34676c688d342a79ec85de6b6c2c2b0.jpg',0),(8,'冰封侠：时空行者','The Frozen Hero II','甄子丹:贺英,王宝强:萨獒,黄圣依:小美','叶伟民','该片讲述了明朝大将贺英（甄子丹饰）、元龙（任达华饰）、聂虎（喻亢饰）、萨獒（王宝强饰）从尘封的冰山中穿越至现代，利用时空金球终于重返明朝，贺英与锦衣卫兄弟萨獒获悉了倭寇和朝廷奸党之间足以倾覆皇权的密谋，绵延400年的惊天危机一触即发。贺英也在红颜知己小美的帮助下开始了抗倭锄奸和保护族人的战斗。','87分钟','动作',5.3,NULL,NULL,'2020-06-02','中国大陆','../upload/movies/4099056267d74bc6bbc5e050d11b0453.jpg',0),(9,'千与千寻','Spirited Away ','入野自由:白龙, 夏木真理:汤婆婆·钱婆婆,柊瑠美:千寻','宫崎骏','10岁的少女千寻与父母一起从都市搬家到了乡下。没想到在搬家的途中，一家人发生了意外。他们进入了汤屋老板魔女控制的奇特世界——在那里不劳动的人将会被变成动物。千寻的爸爸妈妈因贪吃变成了猪，千寻为了救爸爸妈妈经历了很多磨难，在期间她遇见了白龙，一个既聪明又冷酷的少年，在经历了很多事情之后，千寻最后救出了爸爸妈妈，拯救了白龙。','125分钟','动画',8.5,NULL,NULL,'2020-06-02','日本','../upload/movies/be1e3026252c4e169ba61b3f1cf86023.jpg',0),(10,'扫毒','The White Storm','古天乐: 苏建秋,刘青云:马昊天','陈木胜','从小一起长大的好兄弟马昊天、张子伟和苏建秋共同效力于毒品调查科。在一次临时改变计划的行动后，苏建秋因为卧底身份不能与妻子过正常生活而心生退意，但在马昊天与张子伟的劝说下，三人决定进行最后一搏。苏建秋跟着毒贩老大黑柴前往泰国与毒贩Bobby进行对接，目的是见到行动的最大目标“八面佛”，马昊天则和张子伟以及同事王顺益进行跟进。由于泰国警方的配合不力导致苏建秋身份暴露，虽然苏建秋答应马昊天继续把交易完成，但失败的导火索已经埋下。交易当天警方几乎全军覆没，危急之时马昊天挟持了八面佛的女儿缅娜准备逃命，八面佛承诺只要还回缅娜，马昊天可以带走苏建秋和张子伟中的一个，没被选中的则要被推进鳄鱼池。面对抉择，马昊天进退两难，手心手背，然而他做的决定却已经注定了这场“扫毒”行动的代价。','134分钟','犯罪',7.5,NULL,NULL,'2020-06-02','中国香港','../upload/movies/bd59914175f3481780de0f2f396de94e.jpg',0),(11,'流浪地球','The Wandering Earth','屈楚萧:刘启,吴京:刘培强','郭帆','近年来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划，即倾全球之力在地球表面建造上万座发动机和转向发动机，推动地球离开太阳系，用2500年的时间奔往新家园。\n中国航天员刘培强（吴京饰）在儿子刘启四岁那年前往领航员空间站，和国际同侪肩负起领航者的重任。转眼刘启（屈楚萧饰）长大，他带着妹妹韩朵朵（赵今麦饰）偷偷跑到地表，偷开外公韩子昂（吴孟达饰）的运输车，结果不仅遭到逮捕，还遭遇了全球发动机停摆的事件。为了修好发动机，阻止地球坠入木星，全球开始展开饱和式营救，连刘启他们的车也被强征加入。在与时间赛跑的过程中，无数的人前仆后继，奋不顾身，只为延续百代子孙生存的希望。','125分钟','科幻',5.8,5000000,45644565,'2020-06-02','中国大陆','../upload/movies/d4f594585a9343e5b919a41f76b2b841.jpg',1),(12,'海王','Aquaman','杰森·莫玛:亚瑟·库瑞,威廉·达福:维科,艾梅柏·希尔德:湄拉','温子仁','在一场狂风暴雨的海边灯塔看守人汤姆·库瑞（特穆拉·莫里森饰）救了受伤的亚特兰蒂斯女王亚特兰娜（妮可·基德曼饰）之后，他们相爱了，生下了拥有半人类、半亚特兰蒂斯人的血统亚瑟·库瑞（杰森·莫玛饰）。为了救自己的爱人和儿子亚特兰娜选择了离开。\n几年之后，亚特兰娜被迫回到海底国家缔结政治婚姻，生下儿子奥姆（帕特里克·威尔森饰）。奥姆长大后当上国王对陆地人类充满憎恨，开始吞并海底中发展中的国家的兵力，一举消灭陆地人。奥姆的未婚妻海底王国泽贝尔公主湄拉（艾梅柏·希尔德饰）打算阻止这场战争，她到陆地找回亚瑟，让他以亚特兰娜女王长子身份回亚特兰蒂斯把王位争回来，而且湄拉要协助亚瑟找回能统治大海的失落的三叉戟。','147分钟','科幻',5.1,1140000,858778,'2020-06-03','美国','../upload/movies/39cbf4fc014f4fc3901877f89f9eb361.jpg',1),(13,'疯狂的外星人','Crazy Alien','黄渤:耿浩,沈腾:大飞,马修·莫里森:Captain Zach Andrews,汤姆·派福瑞:John Stockton','宁浩','耿浩（黄渤饰）与一心想发大财的好兄弟大飞（沈腾饰），经营着各自惨淡的“事业”，然而“天外来客”的意外降临，打破了二人平静又拮据的生活。神秘的西方力量也派出“哼哈二将”在全球寻找外星人踪影。啼笑皆非的跨物种对决，别开生面的“星战”，在中国某海边城市激情上演。','116分钟','喜剧',5.7,1700000,768735,'2020-06-03','中国大陆','../upload/movies/30469f053a91454588499b8a82df9a16.jpg',1),(14,'aa','aa','aa:aa','aa','aa','aa','aa',7.8,NULL,NULL,'2020-06-03','aa','../upload/movies/ced24ff055844036b8ac3007e0c363a5.jpg',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderinfo` (
  `order_id` varchar(30) NOT NULL,
  `user_id` bigint NOT NULL,
  `schedule_id` bigint NOT NULL,
  `order_position` varchar(30) DEFAULT NULL,
  `order_state` int DEFAULT '1',
  `order_price` int DEFAULT NULL,
  `order_time` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `usr_ord` (`user_id`),
  KEY `sch_ord` (`schedule_id`),
  CONSTRAINT `orderinfo_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderinfo_ibfk_4` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderinfo`
--

LOCK TABLES `orderinfo` WRITE;
/*!40000 ALTER TABLE `orderinfo` DISABLE KEYS */;
INSERT INTO `orderinfo` VALUES ('2020060900010409',1,3,'4排9座',2,50,'2020-06-09'),('2020060900010509',1,2,'5排9座',1,37,'2020-06-09'),('2020061000010508',1,2,'5排8座',2,37,'2020-06-10');
/*!40000 ALTER TABLE `orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` bigint NOT NULL AUTO_INCREMENT,
  `hall_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  `schedule_startTime` varchar(45) DEFAULT NULL,
  `schedule_price` int DEFAULT NULL,
  `schedule_remain` int DEFAULT NULL,
  `schedule_state` int DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `mv_sch` (`movie_id`),
  KEY `hl_sch` (`hall_id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (2,1,5,'2020-06-12 15:30:00',37,16,1),(3,2,2,'2020-06-12 20:30:00',50,14,1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL,
  `user_email` varchar(25) DEFAULT NULL,
  `user_role` int DEFAULT '0',
  `user_headImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','1402129509@qq.com',1,'../static/images/profile/admin.png'),(2,'user','user','1402129509@qq.com',0,'../static/images/profile/user.jpg'),(3,'hello','world','helloworld@qq.com',NULL,'../upload/head/6cc1ee94cd804ab1bcc7865ad2058eea.png'),(4,'test','test','1402129509@qq.com',0,NULL),(5,'username','password','email',0,NULL),(6,'uuu','uuu','uuu',0,'../upload/head/aaa67186762c4c739699ad2c26cbd211.png'),(7,'qqq','qqq','qqq',0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-10 12:25:23
