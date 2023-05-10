-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_colleage` (
  `colleageNumber` varchar(50)  NOT NULL COMMENT 'colleageNumber',
  `colleageName` varchar(60)  NOT NULL COMMENT 'ѧԺ����',
  PRIMARY KEY (`colleageNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_classInfo` (
  `classNumber` varchar(50)  NOT NULL COMMENT 'classNumber',
  `className` varchar(100)  NOT NULL COMMENT '�༶����',
  `colleageObj` varchar(50)  NOT NULL COMMENT '����ѧԺ',
  `banzhuren` varchar(30)  NULL COMMENT '������',
  `startDate` varchar(20)  NULL COMMENT '��������',
  PRIMARY KEY (`classNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_student` (
  `studentNumber` varchar(40)  NOT NULL COMMENT 'studentNumber',
  `password` varchar(50)  NOT NULL COMMENT '��¼����',
  `classObj` varchar(50)  NOT NULL COMMENT '���ڰ༶',
  `studentName` varchar(40)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `studentPhoto` varchar(60)  NOT NULL COMMENT 'ѧ����Ƭ',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NULL COMMENT '����',
  PRIMARY KEY (`studentNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_course` (
  `courseNo` varchar(20)  NOT NULL COMMENT 'courseNo',
  `courseName` varchar(50)  NOT NULL COMMENT '�γ�����',
  `courseType` varchar(20)  NOT NULL COMMENT '�γ�����',
  `courseScore` float NOT NULL COMMENT '�γ�ѧ��',
  `teacherName` varchar(20)  NOT NULL COMMENT '�Ͽ���ʦ',
  `courseHour` int(11) NOT NULL COMMENT '�γ���ѧʱ',
  PRIMARY KEY (`courseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_courseScore` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ɼ�id',
  `studentObj` varchar(40)  NOT NULL COMMENT 'ѧ��',
  `courseObj` varchar(20)  NOT NULL COMMENT '�γ�',
  `score` float NOT NULL COMMENT '�ɼ�',
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_addScoreItem` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ӷ���Ŀid',
  `itemName` varchar(20)  NOT NULL COMMENT '�ӷ���Ŀ����',
  `itemScore` float NOT NULL COMMENT '�ӷ���Ŀ����',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_studentAddScore` (
  `addScoreId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ӷ�id',
  `studenObj` varchar(40)  NOT NULL COMMENT 'ѧ��',
  `addScoreObj` int(11) NOT NULL COMMENT '�ӷ���Ŀ',
  `proof` varchar(60)  NOT NULL COMMENT '֤������',
  `shengQingShiJian` varchar(20)  NULL COMMENT '����ʱ��',
  `shenHeState` varchar(20)  NOT NULL COMMENT '���״̬',
  `shenHeTime` varchar(20)  NULL COMMENT '���ʱ��',
  PRIMARY KEY (`addScoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_finalScore` (
  `scoreId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ɼ�id',
  `studentObj` varchar(40)  NOT NULL COMMENT 'ѧ��',
  `colleageObj` varchar(50)  NOT NULL COMMENT 'ѧԺ',
  `classObj` varchar(50)  NOT NULL COMMENT '�༶',
  `courseFinalScore` float NOT NULL COMMENT '��Ŀ�ɼ������',
  `finalAddScore` float NOT NULL COMMENT '����Ŀ�ӷ���',
  `finalScore` float NOT NULL COMMENT '�ܷ�',
  PRIMARY KEY (`scoreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `teacherUserName` varchar(20)  NOT NULL COMMENT 'teacherUserName',
  `password` varchar(20)  NULL COMMENT '��¼����',
  `teacherName` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  PRIMARY KEY (`teacherUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE t_classInfo ADD CONSTRAINT FOREIGN KEY (colleageObj) REFERENCES t_colleage(colleageNumber);
ALTER TABLE t_student ADD CONSTRAINT FOREIGN KEY (classObj) REFERENCES t_classInfo(classNumber);
ALTER TABLE t_courseScore ADD CONSTRAINT FOREIGN KEY (studentObj) REFERENCES t_student(studentNumber);
ALTER TABLE t_courseScore ADD CONSTRAINT FOREIGN KEY (courseObj) REFERENCES t_course(courseNo);
ALTER TABLE t_studentAddScore ADD CONSTRAINT FOREIGN KEY (studenObj) REFERENCES t_student(studentNumber);
ALTER TABLE t_studentAddScore ADD CONSTRAINT FOREIGN KEY (addScoreObj) REFERENCES t_addScoreItem(itemId);
ALTER TABLE t_finalScore ADD CONSTRAINT FOREIGN KEY (studentObj) REFERENCES t_student(studentNumber);
ALTER TABLE t_finalScore ADD CONSTRAINT FOREIGN KEY (colleageObj) REFERENCES t_colleage(colleageNumber);
ALTER TABLE t_finalScore ADD CONSTRAINT FOREIGN KEY (classObj) REFERENCES t_classInfo(classNumber);


