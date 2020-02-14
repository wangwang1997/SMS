/*
Navicat MySQL Data Transfer

Source Server         : Localconn
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : sms2

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-07-11 11:14:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` longtext,
  `createDate` date DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `sid` (`sid`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '多学习代码', '非常棒的体验(๑•̀ㅂ•́)و✧', '2019-04-25', '1');
INSERT INTO `blog` VALUES ('2', '很棒很不错', '11111', '2019-07-10', '3');
INSERT INTO `blog` VALUES ('3', 'veryGood', '2313', '2019-07-11', '5');
INSERT INTO `blog` VALUES ('4', 'JIM CODE', '色啊额全额我去饿我去', '2019-07-11', '7');
INSERT INTO `blog` VALUES ('5', '1', '1231', '2019-07-11', '1');
INSERT INTO `blog` VALUES ('6', '你好', '萨非西方的撒饿我去二队v从v想法', '2019-07-11', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `cdesc` varchar(500) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Java', 'a、JAVA程序设计,\nb、SQL SERVER 高级应用\n,c、jQuery高级编程,\nd、HTML5与CSS3开发\n,e、Oracle数据库应用', '1');
INSERT INTO `course` VALUES ('2', 'Web前端', 'a、HTML网页基础,\nb、CSS语言,\nc、PS设计\n,d、UI设计', '1');
INSERT INTO `course` VALUES ('3', 'Android', 'a、JAVA开发基础\n,b、Android基础\n,c、Android高级技术\n,d、UI设计', '1');
INSERT INTO `course` VALUES ('4', 'Phython', 'a、JAVA程序设计\n,b、SQL SERVER 高级应用\n,c、jQuery高级编程\n,d、HTML5与CSS3开发\n,e、Oracle数据库应用', '1');
INSERT INTO `course` VALUES ('5', '大数据', 'a、JAVA程序设计,\nb、SQL SERVER 高级应用\n,c、jQuery高级编程\n,d、HTML5与CSS3开发\n,e、Oracle数据库应用', '1');
INSERT INTO `course` VALUES ('6', 'C++', 'a、JAVA程序设计\n,b、SQL SERVER 高级应用\n,c、jQuery高级编程\n,d、HTML5与CSS3开发,\ne、Oracle数据库应用', '1');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) NOT NULL,
  `gdesc` varchar(500) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  UNIQUE KEY `gname` (`gname`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', 'WBS17091', '中兴软件WBS17091班', '0');
INSERT INTO `grade` VALUES ('2', 'WBS17081', '中兴软件WBS17081班', '1');
INSERT INTO `grade` VALUES ('3', 'WBS17071', '中兴软件WBS17071班', '1');
INSERT INTO `grade` VALUES ('4', 'WBS17072', '中兴软件WBS17072班', '0');
INSERT INTO `grade` VALUES ('5', 'WBS17082', '中兴软件WBS17082班', '0');
INSERT INTO `grade` VALUES ('6', 'WBS17101', '中兴软件WBS17101班', '1');
INSERT INTO `grade` VALUES ('7', 'WBS17102', '中兴软件WBS17102班', '1');
INSERT INTO `grade` VALUES ('8', 'WBS17111', '中兴软件WBS17111班', '1');
INSERT INTO `grade` VALUES ('9', 'WBS17112', '中兴软件WBS17112班', '1');
INSERT INTO `grade` VALUES ('11', 'WBS18091', '中兴软件WBS18091班', '1');
INSERT INTO `grade` VALUES ('12', 'WBS18092', '中兴软件WBS18092班', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `username` (`username`),
  KEY `gid` (`gid`),
  KEY `cid` (`cid`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `grade` (`gid`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'aaa', '123', 'aaa', '1', '20', '1', '2');
INSERT INTO `student` VALUES ('2', 'bbb', '123', 'bbb', '0', '20', '2', '1');
INSERT INTO `student` VALUES ('3', 'ccc', '123', 'ccc', '1', '20', '1', '2');
INSERT INTO `student` VALUES ('4', 'ddd', '123', 'ddd', '0', '20', '1', '1');
INSERT INTO `student` VALUES ('5', 'eee', '123', 'eee', '1', '20', '2', '2');
INSERT INTO `student` VALUES ('6', 'fff', '123', 'fff', '0', '20', '1', '2');
INSERT INTO `student` VALUES ('7', 'dfd', '123', 'dfd', '1', '15', '1', '2');
INSERT INTO `student` VALUES ('8', 'zjw9704', '123', '小毛衣', '1', '20', '1', '1');
INSERT INTO `student` VALUES ('9', 'kkk', '123', '牛仔', '0', '20', '1', '6');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'mike', '123', '1');
