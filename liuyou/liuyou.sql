/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.5.40 : Database - liuyou
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`liuyou` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `liuyou`;

/*Table structure for table `allusers` */

DROP TABLE IF EXISTS `allusers`;

CREATE TABLE `allusers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `cx` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `allusers` */

insert  into `allusers`(`ID`,`username`,`pwd`,`cx`,`addtime`) values 

(1,'cd','cd','SuperAdmin','2023-11-15 12:26:54');

/*Table structure for table `dx` */

DROP TABLE IF EXISTS `dx`;

CREATE TABLE `dx` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `leibie` varchar(50) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dx` */

insert  into `dx`(`ID`,`leibie`,`content`) values 
(1,'system notice','<P>&nbsp;&nbsp;&nbsp; Welcome to this website, this is mainly for the majority of friends carefully crafted a system, I hope you can get a good mood in me, thank you!</P>'),

(2,'system introduction',' Tourism website is a fashionable way of tourism, that is, to "publicize personality, close to nature, relax the body and mind" as the goal, completely independent selection and arrangement of tourism activities, and there is no full guide accompanied by a tourism way. The biggest advantage of self-service tourism is that tourists have strong autonomy, they can choose their own route, time and place at will, and they can also independently control their own expenses, which is a more mature tourist willing to take.');

/*Table structure for table `gwc` */

DROP TABLE IF EXISTS `gwc`;

CREATE TABLE `gwc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `bianhao` varchar(50) DEFAULT NULL,
  `mingcheng` varchar(50) DEFAULT NULL,
  `tupian` varchar(50) DEFAULT NULL,
  `jiage` double DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shuliang` int(11) DEFAULT NULL,
  `isfk` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `gwc` */

insert  into `gwc`(`ID`,`username`,`bianhao`,`mingcheng`,`tupian`,`jiage`,`addtime`,`shuliang`,`isfk`) values 

(1,'555','004','勋章','upload/1334986363312.jpg',420,'2020-03-01 02:04:24',2,'否'),

(2,'yyy','003','金龙油','upload/1334986338171.jpg',13,'2020-03-01 02:04:24',3,'否');

/*Table structure for table `jingdianxinxi` */

DROP TABLE IF EXISTS `jingdianxinxi`;

CREATE TABLE `jingdianxinxi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(50) DEFAULT NULL,
  `xingji` varchar(50) DEFAULT NULL,
  `dizhi` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `jianjie` varchar(500) DEFAULT NULL,
  `zhaopian` varchar(50) DEFAULT NULL,
  `piaojia` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `jingdianxinxi` */

insert  into `jingdianxinxi`(`ID`,`mingcheng`,`xingji`,`dizhi`,`dianhua`,`jianjie`,`zhaopian`,`piaojia`,`addtime`) values 

(1,'ChengShan Cape','3 stars level','Weihai','12236547896','beautiful place','upload/1335007505203.jpg','150','2023-11-15 09:05:12'),

(2,'Liugongdao Fengjingqu','4 stars level','Weihai','13025896471','nice place','upload/1335007537000.jpg','100','2023-11-15 09:05:12'),

(3,'Xianguding Scenic Area','5 stars level','Weihai','15120369874','good scenery','upload/1335007591843.jpg','110','2023-11-15 09:05:12'),

(4,'Chishan ScenicArea','5 stars level','Weihai','16547896521','nice scenery','upload/1335007669640.jpg','50','2023-11-15 09:05:12'),

(5,'Sea Donkey Island','3 stars level','Weihai','17789632540','beauty spot','upload/1335010069953.jpg','120','2023-11-15 09:05:12');


/*Table structure for table `jiudianxinxi` */

DROP TABLE IF EXISTS `jiudianxinxi`;

CREATE TABLE `jiudianxinxi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) DEFAULT NULL,
  `mingcheng` varchar(300) DEFAULT NULL,
  `xingji` varchar(50) DEFAULT NULL,
  `dizhi` varchar(300) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `zhaopian` varchar(50) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `jiudianxinxi` */

insert  into `jiudianxinxi`(`ID`,`bianhao`,`mingcheng`,`xingji`,`dizhi`,`dianhua`,`zhaopian`,`beizhu`,`addtime`) values 
(1,'Apple Hotel','101','129','2023-11-15','1','Wang Ming','13847925088','123456789','yo','WWW','yes','2023-11-15 09:05:12'),

(2,'Banana Hotel','202','139','2023-11-16','2','Xiao Hong','18645678912','987654321','what','LLL','yes','2023-11-15 09:05:12'),

(3,'Application Hotel','303','1899','2023-11-15','3','Liu Gang','15123698745','172839456','is','FFF','yes','2023-11-15 09:05:12'),

(4,'Cap Hotel','404','129','2023-11-17','3','Xiao Hui','15021459364','718293654','up','YYY','yes','2023-11-15 09:05:12'),

(5,'Cape Hotel','505','299','2023-11-15','2','Zhi Gang','18896317568','134697852','man','ZZZ','yes','2023-11-15 09:05:12');

/*Table structure for table `jiudianyuding` */

DROP TABLE IF EXISTS `jiudianyuding`;

CREATE TABLE `jiudianyuding` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `jiudianmingcheng` varchar(300) DEFAULT NULL,
  `kefangbianhao` varchar(50) DEFAULT NULL,
  `jiage` varchar(50) DEFAULT NULL,
  `yudingshijian` varchar(50) DEFAULT NULL,
  `yudingtianshu` varchar(50) DEFAULT NULL,
  `nindexingming` varchar(50) DEFAULT NULL,
  `nindedianhua` varchar(50) DEFAULT NULL,
  `nindeshenfenzheng` varchar(300) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `yonghuming` varchar(50) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `jiudianyuding` */

insert  into `jiudianyuding`(`ID`,`jiudianmingcheng`,`kefangbianhao`,`jiage`,`yudingshijian`,`yudingtianshu`,`nindexingming`,`nindedianhua`,`nindeshenfenzheng`,`beizhu`,`yonghuming`,`issh`,`addtime`) values 
(1,'Apple Hotel','101','129','2023-11-15','1','Wang Ming','13847925088','123456789','yo','WWW','yes','2023-11-15 09:05:12'),

(2,'Apple Hotel','202','139','2023-11-16','2','Xiao Hong','18645678912','987654321','what','LLL','yes','2023-11-15 09:05:12'),

(3,'Cap Hotel','303','1899','2023-11-15','3','Liu Gang','15123698745','172839456','is','FFF','yes','2023-11-15 09:05:12'),

(4,'Cap Hotel','404','129','2023-11-17','3','Xiao Hui','15021459364','718293654','up','YYY','yes','2023-11-15 09:05:12'),

(5,'Cap Hotel','505','299','2023-11-15','2','Zhi Gang','18896317568','134697852','man','ZZZ','yes','2023-11-15 09:05:12');


/*Table structure for table `kefang` */

DROP TABLE IF EXISTS `kefang`;

CREATE TABLE `kefang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `jiudian` varchar(300) DEFAULT NULL,
  `kefangbianhao` varchar(50) DEFAULT NULL,
  `leixing` varchar(50) DEFAULT NULL,
  `daxiao` varchar(50) DEFAULT NULL,
  `jiage` varchar(50) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `kefang` */

insert  into `kefang`(`ID`,`jiudian`,`kefangbianhao`,`leixing`,`daxiao`,`jiage`,`beizhu`,`addtime`) values 
(1,'Apple Hotel','101','economical','single room','129','yo','2023-11-15 09:05:12'),
(2,'Apple Hotel','202','business','double room','139','what','2023-11-15 09:05:12'),
(3,'Cap Hotel','303','economical','double room','1899','is','2023-11-15 09:05:12'),
(4,'Cap Hotel','404','business','single room','129','up','2023-11-15 09:05:12'),
(5,'Cap Hotel','505','economical','single room','299','man','2023-11-15 09:05:12'),
(6,'Cap Hotel','606','business','double room','333','bro','2023-11-15 09:05:12');

/*Table structure for table `liuyanban` */

DROP TABLE IF EXISTS `liuyanban`;

CREATE TABLE `liuyanban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cheng` varchar(50) DEFAULT NULL,
  `xingbie` varchar(2) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `neirong` varchar(500) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `huifuneirong` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanban` */

insert  into `liuyanban`(`ID`,`cheng`,`xingbie`,`QQ`,`youxiang`,`dianhua`,`neirong`,`addtime`,`huifuneirong`) values 

(1,'erhre','1','2352362','wegwe@163.com','23262362','gwegewg','2020-03-01 02:04:24','gdfgd'),

(2,'hfdshdsf','2','3463473','erhe@163.com','3463634','ggwgwegw','2020-03-01 02:04:24','gfdgdfgdf'),

(3,'jrttrktr','4','634633','geer@163.com','34633634','gehre','2020-03-01 02:04:24','tjtrjrt'),

(4,'rrtr','1','34643634','4e@163.com','6436435','gegew','2020-03-01 02:04:24','hreher'),

(5,'tktykty','3','5754745','jr@163.com','54363463','erher','2020-03-01 02:04:24','sdgsdgs');

/*Table structure for table `pinglun` */

DROP TABLE IF EXISTS `pinglun`;

CREATE TABLE `pinglun` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `xinwenID` varchar(50) DEFAULT NULL,
  `pinglunneirong` varchar(500) DEFAULT NULL,
  `pinglunren` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pinglun` */

insert  into `pinglun`(`ID`,`xinwenID`,`pinglunneirong`,`pinglunren`,`addtime`) values 

(1,'2','hreher','555','2020-03-01 02:04:24'),

(2,'2','hehre','yyy','2020-03-01 02:04:24'),

(3,'4','2222','cd','2020-03-01 02:04:24'),

(4,'7','333','cd','2020-03-01 02:04:24');

/*Table structure for table `xianlujiatuan` */

DROP TABLE IF EXISTS `xianlujiatuan`;

CREATE TABLE `xianlujiatuan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `xianlubianhao` varchar(50) DEFAULT NULL,
  `xianlumingcheng` varchar(300) DEFAULT NULL,
  `chufadi` varchar(50) DEFAULT NULL,
  `mudedi` varchar(50) DEFAULT NULL,
  `jiaotonggongju` varchar(50) DEFAULT NULL,
  `feiyong` varchar(50) DEFAULT NULL,
  `chuxingshijian` varchar(50) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `canjiaren` varchar(50) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `issh` varchar(2) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `xianlujiatuan` */

insert  into `xianlujiatuan`(`ID`,`xianlubianhao`,`xianlumingcheng`,`chufadi`,`mudedi`,`jiaotonggongju`,`feiyong`,`chuxingshijian`,`faburen`,`canjiaren`,`beizhu`,`issh`,`addtime`) values 
(1,'001','two days tour of Weihai','Weihai','Weihai','bike','200','2023-11-15','bjw','www','yo','no','2023-11-15 09:05:12'),

(2,'002','two days tour of Weihai','Weihai','Weihai','car','300','2023-11-15','bjw','hhh','abab','no','2023-11-15 09:05:12');

/*Table structure for table `xinwentongzhi` */

DROP TABLE IF EXISTS `xinwentongzhi`;

CREATE TABLE `xinwentongzhi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(300) DEFAULT NULL,
  `leibie` varchar(50) DEFAULT NULL,
  `neirong` longtext,
  `tianjiaren` varchar(50) DEFAULT NULL,
  `shouyetupian` varchar(50) DEFAULT NULL,
  `dianjilv` varchar(10) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `xinwentongzhi` */

insert  into `xinwentongzhi`(`ID`,`biaoti`,`leibie`,`neirong`,`tianjiaren`,`shouyetupian`,`dianjilv`,`addtime`) values 

(1,'法国阿尔萨斯旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd','upload/1317085936937.jpg','2','2020-03-01 02:04:24'),

(2,'美国旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd','upload/1317085936937.jpg','6','2020-03-01 02:04:24'),

(3,'日本旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd','upload/1317085936937.jpg','4','2020-03-01 02:04:24'),

(4,'英国旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd','upload/1317085936937.jpg','7','2020-03-01 02:04:24'),

(5,'澳大利亚旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'7','2020-03-01 02:04:24'),

(6,'瑞典旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'38','2020-03-01 02:04:24'),

(7,'西班牙中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'9','2020-03-01 02:04:24'),

(8,'韩国旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'3','2020-03-01 02:04:24'),

(9,'阿拉斯加旅行中的美味艳遇','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'3','2020-03-01 02:04:24'),

(10,'新冠防护须知3','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'4','2020-03-01 02:04:24'),

(11,'新冠防护须知2','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'3','2020-03-01 02:04:24'),

(12,'新冠防护须知1','news','阿尔萨斯人有一种不同于法国其他地方的气质，淡薄、质朴中带着几分豪爽，他们住着古老的木筋房，大块吃肉、大口喝酒，隐居乡村。开辆法国车，顺着阿尔萨斯乡间小路一头扎进去，便能很容易体味到只属于那里的美食、美酒和生活态度。','cd',NULL,'7','2020-03-01 02:04:24');

/*Table structure for table `yonghuzhuce` */

DROP TABLE IF EXISTS `yonghuzhuce`;

CREATE TABLE `yonghuzhuce` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `xingming` varchar(50) DEFAULT NULL,
  `xingbie` varchar(2) DEFAULT NULL,
  `chushengnianyue` varchar(50) DEFAULT NULL,
  `QQ` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `shenfenzheng` varchar(50) DEFAULT NULL,
  `touxiang` varchar(50) DEFAULT NULL,
  `dizhi` varchar(300) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `issh` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `yonghuzhuce` */

insert  into `yonghuzhuce`(`ID`,`yonghuming`,`mima`,`xingming`,`xingbie`,`chushengnianyue`,`QQ`,`youxiang`,`dianhua`,`shenfenzheng`,`touxiang`,`dizhi`,`beizhu`,`addtime`,`issh`) values 
(1,'aaa','654','Abner','M','2002-01-01','123456789','456@163.com','18659368974','963258741','upload/1333961148718.jpg','No.1,Sijiqing Plaze, Hangzhou','ok','2023-11-15 09:05:12','yes'),
(2,'jack','321','Jack','M','2003-02-02','321654987','123@163.com','15147896325','147852369','upload/1333963398718.gif','No.2,Sijiqing Plaze, Hangzhou','yes','2023-11-15 09:05:12','yes'),
(3,'tom','789','Tom','M','2004-03-03','789456123','789@163.com','1385963214','321456987','upload/1333963445546.gif','No.22,Sijiqing Plaze, Hangzhou','no','2023-11-15 09:05:12','yes'),
(4,'lily','123','Lily','F','2005-04-04','741852963','147@163.com','15023697412','321456778','upload/1333963661093.jpg','No.5,Sijiqing Plaze, Hangzhou','yep','2023-11-15 09:05:12','yes'),
(5,'ppp','456','Pop','F','2006-05-05','963852741','369@163.com','15546693321','665412874','upload/1335009847625.gif','No.7,Sijiqing Plaze, Hangzhou','fine','2023-11-15 09:05:12','yes'),
(6,'admm','987','Admin','F','2007-06-06','195864723','','','','','','','2023-11-15 09:05:12','yes');


/*Table structure for table `zijiayouxianlu` */

DROP TABLE IF EXISTS `zijiayouxianlu`;

CREATE TABLE `zijiayouxianlu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `xianlubianhao` varchar(50) DEFAULT NULL,
  `xianlumingcheng` varchar(300) DEFAULT NULL,
  `chufadi` varchar(50) DEFAULT NULL,
  `mudedi` varchar(50) DEFAULT NULL,
  `jiaotonggongju` varchar(50) DEFAULT NULL,
  `feiyong` varchar(50) DEFAULT NULL,
  `chuxingshijian` varchar(50) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  `faburen` varchar(50) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `zijiayouxianlu` */

insert  into `zijiayouxianlu`(`ID`,`xianlubianhao`,`xianlumingcheng`,`chufadi`,`mudedi`,`jiaotonggongju`,`feiyong`,`chuxingshijian`,`beizhu`,`faburen`,`addtime`) values 
(1,'001','Weihai three days tour','Weihai','Weihai','car','550','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(2,'002','Weihai three days tour','Weihai','Weihai','bike','200','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(3,'003','Weihai three days tour','Weihai','Weihai','train','400','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(4,'004','Weihai three days tour','Weihai','Weihai','bus','40','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(5,'005','Weihai two days tour','Weihai','Weihai','bike','150','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(6,'006','Weihai two days tour','Weihai','Weihai','bus','30','2023-12-12','nothing','bjw','2023-11-15 09:05:12'),
(7,'007','Weihai two days tour','Weihai','Weihai','car','400','2023-12-12','nothing','bjw','2023-11-15 09:05:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
