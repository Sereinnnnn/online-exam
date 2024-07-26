-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: platform_test002
-- ------------------------------------------------------
-- Server version	5.7.37

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `exam_record_id` varchar(64) DEFAULT NULL COMMENT '考试记录id',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程ID',
  `subject_id` varchar(64) DEFAULT NULL COMMENT '题目ID',
  `answer` varchar(255) DEFAULT NULL COMMENT '答案',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`),
  KEY `index_answer` (`user_id`,`examination_id`,`subject_id`) COMMENT '答题索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES ('018021d041964d269d2b421a007d722f','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135',NULL,'4d654c576f534f349278806b046608d6','C','student','2019-02-28 15:33:35','student','2019-02-28 15:34:24','0','EXAM'),('03711433d5604a90bdc8fbf386affb08','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'4d654c576f534f349278806b046608d6','A','root','2024-07-23 09:57:23','root','2024-07-23 09:57:23','0','EXAM'),('1d895c258e624c069258e8f9389f2ad5','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'65740f77844e40d3aba99c284992dbc5','A','root','2024-07-23 09:57:28','root','2024-07-23 09:57:28','0','EXAM'),('270fa391bff84781a853c127d4d69032','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'0a792fbd22294035829733852b5981dd','C','root','2024-07-22 16:38:51','root','2024-07-22 16:38:51','0','EXAM'),('382cf37df5d049cca5f01cf152375431','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'910cefd27a6643bc9879404e7c88e320','A','root','2024-07-23 09:57:30','root','2024-07-23 09:57:30','0','EXAM'),('39a5f9aa02f140cc988ebe8d54f4c887','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'481655b3546944379492a174dd620a19','D','root','2024-07-23 09:57:33','root','2024-07-23 09:57:33','0','EXAM'),('3f0d4789b373404b98b78c60e83baaf2','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a',NULL,'e34926a94a4a4895817d7ea78aa63012','C','tangyi7','2019-01-22 17:27:27','tangyi7','2019-01-22 17:37:18','0','EXAM'),('41802c6b86054942b581e9471fffda26','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'e34926a94a4a4895817d7ea78aa63012','A','root','2024-07-22 16:38:44','root','2024-07-22 16:38:44','0','EXAM'),('44fdf520d4f44ab0ad75bee7e2a16c0f','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a',NULL,'1a934e62942640459b3a66c05f6c09b2','C','tangyi7','2019-01-22 17:29:17','tangyi7','2019-01-22 17:29:17','0','EXAM'),('54cb9fe2605341368fb8e2d16dacd91e','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'1a934e62942640459b3a66c05f6c09b2','A','root','2024-07-23 09:57:24','root','2024-07-23 09:57:24','0','EXAM'),('5befebfb0d6848e98e5caf60f15a505e','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135',NULL,'e34926a94a4a4895817d7ea78aa63012','C','student','2019-02-28 15:33:33','student','2019-02-28 15:34:22','0','EXAM'),('6728441930cb4ba0be3cdd3d5f290175','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'4d654c576f534f349278806b046608d6','C','root','2024-07-22 16:38:47','root','2024-07-22 16:38:47','0','EXAM'),('8874fbd032e14bb198c08452b6fd8976','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'0a792fbd22294035829733852b5981dd','A','root','2024-07-23 09:57:26','root','2024-07-23 09:57:26','0','EXAM'),('967b390a1bb34e1f864f9fb3d8bd2f72','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'65740f77844e40d3aba99c284992dbc5','D','root','2024-07-22 16:38:56','root','2024-07-22 16:38:56','0','EXAM'),('a036f91c1e5346dc98d51acf682dcf88','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'99f7402fec2d47028a8bc0f08048ca8a','B','root','2024-07-23 09:57:31','root','2024-07-23 09:57:31','0','EXAM'),('a4cb0c658a954c8885be5ab3ee5fac5b',NULL,'fad663ea371f4250a81332bd3a346739','6f8679be7eb54e6684739c5473b6e694',NULL,'e34926a94a4a4895817d7ea78aa63012','C','root','2024-07-22 12:32:35','root','2024-07-22 12:32:35','0','EXAM'),('ad7261535e6f4938bbddba407cb9b456','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'481655b3546944379492a174dd620a19','D','root','2024-07-22 16:39:00','root','2024-07-22 16:39:03','0','EXAM'),('b3813d8de8fa490aa02fde1a9ebaa18e','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f',NULL,'1a934e62942640459b3a66c05f6c09b2','D','root','2024-07-22 16:38:49','root','2024-07-22 16:38:49','0','EXAM'),('e50a9b1a595844618c9b92610b2a3f06','80f7f1fac87b420eb263d05161d78daf','e07acc2558134187b06118fe491d9251','6ac16cc96ab04432907a4666aca1ce5d',NULL,'3571aa0eb6644bb788bd06483cd621f0','A','root','2024-07-23 09:38:39','root','2024-07-23 09:38:39','0','EXAM'),('ee2a02497a04429d956174f099a2ddd0','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135',NULL,'1a934e62942640459b3a66c05f6c09b2','C','student','2019-02-28 15:33:38','student','2019-02-28 15:34:25','0','EXAM'),('f3bb2e16c44b4b2f89fb73acc78cb10f','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1',NULL,'e34926a94a4a4895817d7ea78aa63012','A','root','2024-07-23 09:57:20','root','2024-07-23 09:57:20','0','EXAM'),('fe49216810e846c8aeb70d08cdd564b6','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a',NULL,'4d654c576f534f349278806b046608d6','C','tangyi7','2019-01-22 17:29:07','tangyi7','2019-01-22 17:37:21','0','EXAM');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `college` varchar(255) DEFAULT NULL COMMENT '学院',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `teacher` varchar(255) DEFAULT NULL COMMENT '老师',
  `course_description` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('6dcccd4639bc49b88810be1d30a77f92','心理健康','心理学院','心理健康','陈老师','心理健康课程','admin','2018-11-12 22:31:28','admin','2024-07-22 11:01:17','0','EXAM');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_recode`
--

DROP TABLE IF EXISTS `exam_recode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_recode` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户id',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试id',
  `examination_name` varchar(255) DEFAULT NULL COMMENT '考试名称',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程id',
  `start_time` varchar(64) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '结束时间',
  `score` varchar(64) DEFAULT NULL COMMENT '成绩',
  `correct_number` varchar(64) DEFAULT NULL COMMENT '正确题目数量',
  `incorrect_number` varchar(64) DEFAULT NULL COMMENT '错误题目数量',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_recode`
--

LOCK TABLES `exam_recode` WRITE;
/*!40000 ALTER TABLE `exam_recode` DISABLE KEYS */;
INSERT INTO `exam_recode` VALUES ('07d9f8d8af234fbebfc21805eb866b43','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','阿森斯失眠量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-23 09:59:38','2024-07-23 09:57:38','72','6','2','root','2024-07-23 09:59:38','root','2024-07-23 09:59:38','0','EXAM'),('1727e582fca84920a3a24d4f98490c02','80f7f1fac87b420eb263d05161d78daf','f2e2e2358a5d45a8b665d64ff76a64d7','焦虑自评量表（SAS）','6dcccd4639bc49b88810be1d30a77f92','2024-07-22 17:08:28','2024-07-23 09:57:38','72','6','2','root','2024-07-22 17:08:28','root','2024-07-22 17:08:28','0','EXAM'),('2ddc31437a654fbaac3ed924429d0fed','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','阿森斯失眠量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-23 09:59:59','2024-07-23 09:57:38','72','6','2','root','2024-07-23 09:59:59','root','2024-07-23 09:59:59','0','EXAM'),('6ac16cc96ab04432907a4666aca1ce5d','80f7f1fac87b420eb263d05161d78daf','e07acc2558134187b06118fe491d9251','人际关系综合诊断量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-23 09:38:36','2024-07-23 09:57:38','12','1','5','root','2024-07-23 09:38:36','root','2024-07-23 09:38:36','0','EXAM'),('704c1a7dce1b41778f84b6a321f8b2c8','80f7f1fac87b420eb263d05161d78daf','22e2ce7ceab54f51acda0a556ae22ee8','日常生活能力评定量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-23 09:29:31','2024-07-23 09:57:38','12','1','5','root','2024-07-23 09:29:31','root','2024-07-23 09:29:31','0','EXAM'),('9c47cec160bc4a748dc269482f888fbd','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','阿森斯失眠量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-24 21:18:22',NULL,NULL,NULL,NULL,'root','2024-07-24 21:18:22','root','2024-07-24 21:18:22','0','EXAM'),('a9e45350f904449ab405fe23ae9dddb1','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','阿森斯失眠量表','6dcccd4639bc49b88810be1d30a77f92','2024-07-23 09:57:18','2024-07-22 16:39:05','72','6','2','root','2024-07-23 09:57:18','root','2024-07-23 09:57:38','0','EXAM');
/*!40000 ALTER TABLE `exam_recode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examination` (
  `id` varchar(64) NOT NULL,
  `examination_name` varchar(255) DEFAULT NULL COMMENT '考试名称',
  `type` varchar(64) DEFAULT NULL COMMENT '考试类型',
  `attention` varchar(255) DEFAULT NULL COMMENT '考试注意事项',
  `start_time` varchar(64) DEFAULT NULL COMMENT '考试开始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '考试结束时间',
  `duration` varchar(64) DEFAULT NULL COMMENT '考试持续时间',
  `total_score` varchar(64) DEFAULT NULL COMMENT '总分',
  `total_subject` varchar(64) DEFAULT NULL COMMENT '题目数',
  `status` varchar(64) DEFAULT NULL COMMENT '考试状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '封面',
  `avatar_id` varchar(255) DEFAULT NULL,
  `college_id` varchar(64) DEFAULT NULL COMMENT '学院',
  `major_id` varchar(64) DEFAULT NULL COMMENT '专业',
  `course_id` varchar(64) DEFAULT NULL COMMENT '课程',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES ('040e4b018d6b4b33a7c2455c37737af8','正念五因素量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-23 09:48:13','root','2024-07-23 09:48:13','0','EXAM'),('22e2ce7ceab54f51acda0a556ae22ee8','日常生活能力评定量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-22 17:25:22','admin','2024-07-23 09:28:16','0','EXAM'),('297c3414f85746d19849c53fefb61c0e','纽芬兰幸福度量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','1','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-22 17:22:14','root','2024-07-23 09:40:42','0','EXAM'),('47bf30aa596a45dda1ba0d2d2168c1c0','汉密尔顿抑郁量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-22 16:43:24','admin','2024-07-23 09:28:46','0','EXAM'),('829aeed8e55c407a97ddf8d763ba58ac','社会支持评定量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-23 09:41:27','root','2024-07-23 09:41:27','0','EXAM'),('92728fd7d2a84f99930ab4ecf7102c76','职业价值观测验','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-23 09:51:14','root','2024-07-23 09:51:14','0','EXAM'),('e07acc2558134187b06118fe491d9251','人际关系综合诊断量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','1','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-23 09:32:37','root','2024-07-23 09:40:35','0','EXAM'),('f2e2e2358a5d45a8b665d64ff76a64d7','焦虑自评量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','100','10','0','',NULL,'心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','root','2024-07-22 17:06:36','admin','2024-07-23 09:28:42','0','EXAM'),('fad663ea371f4250a81332bd3a346739','阿森斯失眠量表','0','无','2019-02-28 15:00','2029-07-11 17:25','','96','8','0','','a178c7b221524a89b44e884d8e3172cf','心理学院','心理学','6dcccd4639bc49b88810be1d30a77f92','','admin','2018-11-12 20:25:38','root','2024-07-23 09:40:31','0','EXAM');
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incorrect_answer`
--

DROP TABLE IF EXISTS `incorrect_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incorrect_answer` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL COMMENT '考生ID',
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `exam_record_id` varchar(64) DEFAULT NULL COMMENT '考试记录ID',
  `subject_id` varchar(64) DEFAULT NULL COMMENT '题目ID',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '题目序号',
  `incorrect_answer` varchar(255) DEFAULT NULL COMMENT '错误答案',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incorrect_answer`
--

LOCK TABLES `incorrect_answer` WRITE;
/*!40000 ALTER TABLE `incorrect_answer` DISABLE KEYS */;
INSERT INTO `incorrect_answer` VALUES ('010fc8da1a7148e8bb7e616d2d5554b8','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135','e34926a94a4a4895817d7ea78aa63012','1','C','student','2019-02-28 15:34:28','student','2019-02-28 15:34:28','0','EXAM'),('3382eb54a2524235836ef8a47eceb7be','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1','99f7402fec2d47028a8bc0f08048ca8a','7','B','root','2024-07-23 09:57:38','root','2024-07-23 09:57:38','0','EXAM'),('474736033b184374ad9c6046b2352f37','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','4d654c576f534f349278806b046608d6','2','C','tangyi7','2019-01-22 17:37:24','tangyi7','2019-01-22 17:37:24','0','EXAM'),('49f2f2313b5542379bb81cdc3c1e4cc8','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','1a934e62942640459b3a66c05f6c09b2','3','C','tangyi7','2019-01-22 17:36:02','tangyi7','2019-01-22 17:36:02','1','EXAM'),('62ddd8c4d5134c2aa69a16483810f81e','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','e34926a94a4a4895817d7ea78aa63012','1','C','tangyi7','2019-01-22 17:36:13','tangyi7','2019-01-22 17:36:13','1','EXAM'),('6c2c1eea83204e8fb617cadd7ce346b2','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135','1a934e62942640459b3a66c05f6c09b2','3','C','student','2019-02-28 15:34:28','student','2019-02-28 15:34:28','0','EXAM'),('84387f38cfe24aaf8b9460210f253a44','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f','65740f77844e40d3aba99c284992dbc5','5','D','root','2024-07-22 16:39:05','root','2024-07-22 16:39:05','0','EXAM'),('86790b1f98de41059710f55332225d5c','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f','1a934e62942640459b3a66c05f6c09b2','3','D','root','2024-07-22 16:39:05','root','2024-07-22 16:39:05','0','EXAM'),('94e330c215d6497fabab39d0a1520a4f','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','1a934e62942640459b3a66c05f6c09b2','3','C','tangyi7','2019-01-22 17:37:24','tangyi7','2019-01-22 17:37:24','0','EXAM'),('9cfc3052ae3c41028120c45f935664db','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','e34926a94a4a4895817d7ea78aa63012','1','C','tangyi7','2019-01-22 17:37:24','tangyi7','2019-01-22 17:37:24','0','EXAM'),('a7b1b40205b24abc9d56d9ab96de7acc','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','1a934e62942640459b3a66c05f6c09b2','3','C','tangyi7','2019-01-22 17:36:13','tangyi7','2019-01-22 17:36:13','1','EXAM'),('ce9469020c2a4e7282fb5587475233a3','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135','1a934e62942640459b3a66c05f6c09b2','3','C','student','2019-02-28 15:33:47','student','2019-02-28 15:33:47','1','EXAM'),('cf686f2a9eba4a02a01c222bb31a5767','4f3ffc2924f740df93641063559842a6','fad663ea371f4250a81332bd3a346739','f3eb89b5c12941399466676a7341bf3a','1a934e62942640459b3a66c05f6c09b2','3','C','tangyi7','2019-01-22 17:29:57','tangyi7','2019-01-22 17:29:57','1','EXAM'),('e240cfe9aea940bcb31167565527fba6','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f','4d654c576f534f349278806b046608d6','2','C','root','2024-07-22 16:39:05','root','2024-07-22 16:39:05','0','EXAM'),('eddfe2b2ebf44eb0a48507833d509a18','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f','0a792fbd22294035829733852b5981dd','4','C','root','2024-07-22 16:39:05','root','2024-07-22 16:39:05','0','EXAM'),('f525bdfd529e4f12bb925068f8f88496','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','a9e45350f904449ab405fe23ae9dddb1','481655b3546944379492a174dd620a19','8','D','root','2024-07-23 09:57:38','root','2024-07-23 09:57:38','0','EXAM'),('f6bdf67b920744f7bb13f2551bb7469c','abd4dbe19faf4f7f8ff239b63acc5d34','fad663ea371f4250a81332bd3a346739','220b2cece0834f359ab76ec42a888135','4d654c576f534f349278806b046608d6','2','C','student','2019-02-28 15:34:28','student','2019-02-28 15:34:28','0','EXAM'),('fa673d385ae3420fbd457be82515a883','80f7f1fac87b420eb263d05161d78daf','fad663ea371f4250a81332bd3a346739','9dee3f46e2bf46c0a3ab07a9166e018f','481655b3546944379492a174dd620a19','8','D','root','2024-07-22 16:39:05','root','2024-07-22 16:39:05','0','EXAM');
/*!40000 ALTER TABLE `incorrect_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge`
--

DROP TABLE IF EXISTS `knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge` (
  `id` varchar(64) NOT NULL,
  `knowledge_name` varchar(255) DEFAULT NULL COMMENT '知识名称',
  `knowledge_desc` varchar(255) DEFAULT NULL COMMENT '知识描述',
  `attachment_id` varchar(255) DEFAULT NULL COMMENT '附件ID',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(255) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` VALUES ('d81ef4c730b6460f98a7898cdba8902b','历史学习资料','历史学习资料','52f17901c5504c608ebb76c8202ca2eb','0','admin','2019-01-01 21:02:00','root','2024-07-22 14:09:46','0','EXAM');
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` varchar(64) NOT NULL,
  `examination_id` varchar(64) DEFAULT NULL COMMENT '考试ID',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '序号',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '题目名称',
  `type` varchar(64) DEFAULT NULL COMMENT '题目类型',
  `content` varchar(255) DEFAULT NULL COMMENT '题目内容',
  `option_a` varchar(255) DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) DEFAULT NULL COMMENT '选项d',
  `option_e` varchar(255) DEFAULT NULL COMMENT '选项e',
  `option_f` varchar(255) DEFAULT NULL COMMENT '选项f',
  `answer` varchar(255) DEFAULT NULL COMMENT '参考答案',
  `score` varchar(64) DEFAULT NULL COMMENT '分值',
  `analysis` varchar(255) DEFAULT NULL COMMENT '解析',
  `level` varchar(64) DEFAULT NULL COMMENT '难度等级',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('01b76ed8500f4f328f7c9ba479a55edf','e07acc2558134187b06118fe491d9251','5','您遇到烦恼时的求助方式：(只选一项)','0','','只靠自己，不接受别人帮助','很少请求别人帮助','有时请求别人帮助','有困难时经常向家人、亲友或组织求援','','','A','10','无','2','root','2024-07-23 09:33:14','root','2024-07-23 09:33:14','0','EXAM'),('0a792fbd22294035829733852b5981dd','fad663ea371f4250a81332bd3a346739','4','总睡眠时间','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','root','2024-07-22 16:27:06','root','2024-07-22 16:27:06','0','EXAM'),('0e99cd66830049f99788e1878ced841a','040e4b018d6b4b33a7c2455c37737af8','6','在行走时，我会有意关注身体部位在行进中的感觉','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:45','root','2024-07-23 09:48:45','0','EXAM'),('1358f032440b4711a5f59fc70cf0750b','e07acc2558134187b06118fe491d9251','3','对于团体（如党组织、宗教组织、工会、学生会等）组织活动，您：(只选一项)','0','','从不参加','偶尔参加','经常参加','主动参加并积极活动','','','A','10','无','2','root','2024-07-23 09:33:02','root','2024-07-23 09:33:02','0','EXAM'),('14cd55321dbc46dcbbc336810401c1a7','22e2ce7ceab54f51acda0a556ae22ee8','8','使用公共车辆','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:44','root','2024-07-22 17:26:44','0','EXAM'),('1a934e62942640459b3a66c05f6c09b2','fad663ea371f4250a81332bd3a346739','3','比期望的时间早醒','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','admin','2018-12-09 21:07:20','admin','2018-12-29 20:32:20','0','EXAM'),('1c54aad53823419e969b57b8f1bbdc6c','eac721ca2d194ee487a936ecb493824a','0','您容易发脾气，经常大声指责别人、或与别人争吵或打架？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:41','root','2024-07-22 17:13:41','0','EXAM'),('1ca195793fad43af825134144ea87ce5','92728fd7d2a84f99930ab4ecf7102c76','9','你的工作必须经常解决新的问题','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:52:02','root','2024-07-23 09:52:02','0','EXAM'),('1d65f7307c5a426eb2a700e5dc3afbb6','e07acc2558134187b06118fe491d9251','8','过分地羡慕和妒忌别人','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:41','root','2024-07-23 09:33:41','0','EXAM'),('23674c14080249009798fdb6801c4c9f','92728fd7d2a84f99930ab4ecf7102c76','0','你的工作能为社会福利带来看的见的效果','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:52:07','root','2024-07-23 09:52:07','0','EXAM'),('2976e18b3c5043488299fe183ec10aba','22e2ce7ceab54f51acda0a556ae22ee8','7','定时上厕所','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:38','root','2024-07-22 17:26:38','0','EXAM'),('29bc172c422044369319a6ab81f9d7c8','f2e2e2358a5d45a8b665d64ff76a64d7','4','我觉得比平常容易紧张和着急','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:29','root','2024-07-22 17:07:29','0','EXAM'),('2c8658cf36b1420090a3ea9df906dfcf','f2e2e2358a5d45a8b665d64ff76a64d7','2','我无缘无故地感到害怕','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:17','root','2024-07-22 17:07:17','0','EXAM'),('319e1c81a86e45a290eb7ed6e2773737','47bf30aa596a45dda1ba0d2d2168c1c0','8','抑郁情绪  ','0','','无','只在问到时才诉述','在访谈中自发地表达','不用言语也可以从表情、姿势、声音或欲哭中流露出这种情绪','自发言语和非语言（表情、动作）表达几乎完全表现为这种情绪','','A','10','无','2','root','2024-07-22 17:00:39','root','2024-07-22 17:00:39','0','EXAM'),('337116e88972418fa850d8ee71aa856d','92728fd7d2a84f99930ab4ecf7102c76','8','你的工作奖金很高','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:57','root','2024-07-23 09:51:57','0','EXAM'),('3429d3844a6d407da4c07574b5f411f2','47bf30aa596a45dda1ba0d2d2168c1c0','3','有罪感  ','0','','无','责备自己，感到自己已连累他人','认为自己犯了罪，或反复思考以往的过失和错误','认为目前的疾病，是对自己错误的惩罚，或有罪恶妄想','罪恶妄想伴有指责或威胁性幻觉','','A','10','无','2','root','2024-07-22 17:00:08','root','2024-07-22 17:00:08','0','EXAM'),('3571aa0eb6644bb788bd06483cd621f0','e07acc2558134187b06118fe491d9251','1','与异性交往太少','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:32:53','root','2024-07-23 09:32:53','0','EXAM'),('37073d4847464a15ba3734f489d72654','47bf30aa596a45dda1ba0d2d2168c1c0','9','自杀  ','0','','无','觉得活着没有意义','希望自己已经死去，或常想到与死有关的事','消极观念（自杀念头）','有严重自杀行为','','A','10','无','2','root','2024-07-22 17:00:45','root','2024-07-22 17:00:45','0','EXAM'),('3cd84e76914a4842a5c7e94ec576a163','47bf30aa596a45dda1ba0d2d2168c1c0','1','入睡困难（初段失眠）  ','0','','无','主诉有入睡困难，上床半小时后仍不能入睡（要注意平时主诉入睡的时间）','主诉每晚均有入睡困难','','','','A','10','无','2','root','2024-07-22 16:59:40','root','2024-07-22 16:59:40','0','EXAM'),('3dc22cea4123431aab783a52bfaa1725','22e2ce7ceab54f51acda0a556ae22ee8','5','做饭菜','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:29','root','2024-07-22 17:26:29','0','EXAM'),('41b340e402324cc5a98ec70fa334a0e7','eac721ca2d194ee487a936ecb493824a','5','您比平时更自信？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:13','root','2024-07-22 17:13:13','0','EXAM'),('41c77a00e0d4439badcb13e94c5fe3a9','eac721ca2d194ee487a936ecb493824a','2','您睡觉比平时少，而且也不想睡？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:12:56','root','2024-07-22 17:12:56','0','EXAM'),('42d6be16799043cca99a186bfe5c6c44','040e4b018d6b4b33a7c2455c37737af8','7','我为自己有不理智的情绪或不合适的情绪而责备自己','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:50','root','2024-07-23 09:48:50','0','EXAM'),('481655b3546944379492a174dd620a19','fad663ea371f4250a81332bd3a346739','8','白天思睡','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','root','2024-07-22 16:27:36','root','2024-07-22 16:27:36','0','EXAM'),('48cb886ce1c2499698ebe386a2ba7799','829aeed8e55c407a97ddf8d763ba58ac','5','您有多少关系密切，可以得到支持和帮助的朋友（只选一项）','0','','一个也没有','1－2个','3－5个','6个或6个以上','','','A','10','无','2','root','2024-07-23 09:45:47','root','2024-07-23 09:45:47','0','EXAM'),('4ab0d0649f494fb7be543575c96b72f6','92728fd7d2a84f99930ab4ecf7102c76','6','你的工作内容经常变换','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:47','root','2024-07-23 09:51:47','0','EXAM'),('4bb49476fd5e4ea9ad5fc0bc0f78c96d','22e2ce7ceab54f51acda0a556ae22ee8','1','做家务','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:08','root','2024-07-22 17:26:08','0','EXAM'),('4d654c576f534f349278806b046608d6','fad663ea371f4250a81332bd3a346739','2','夜间苏醒\n','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','admin','2018-12-09 21:07:07','root','2024-07-22 16:26:41','0','EXAM'),('4e50b516304c4266affab6dad532a833','92728fd7d2a84f99930ab4ecf7102c76','3','你能在你的工作范围内自由发挥','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:31','root','2024-07-23 09:51:31','0','EXAM'),('51dab8509c144edea6868c4ba0b1e466','f2e2e2358a5d45a8b665d64ff76a64d7','9','我容易心里烦乱或觉得惊恐','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:09:35','root','2024-07-22 17:09:35','0','EXAM'),('56351a00ce65489babcd6330dd3d405c','eac721ca2d194ee487a936ecb493824a','8','您话比平时多，或说话速度比平时快？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:30','root','2024-07-22 17:13:30','0','EXAM'),('58681bb74e7246ddab8c4dabb56665a4','829aeed8e55c407a97ddf8d763ba58ac','9','近一年来，您(只选一项)','0','','远离家人，且独居一室','住处经常变动，多数时间和陌生人住在一起','和同学、同事或朋友住在一起','和家人住在一起','','','A','10','无','2','root','2024-07-23 09:46:05','root','2024-07-23 09:46:05','0','EXAM'),('58e2d35cbe4e4f3ab4c68c65f9c0d164','829aeed8e55c407a97ddf8d763ba58ac','6','您和邻居：(只选一项)','0','','相互之间从不关心，只是点头之交','遇到困难可能稍微关心','有些邻居很关心您','大多数邻居都很关心您','','','A','10','无','2','root','2024-07-23 09:45:51','root','2024-07-23 09:45:51','0','EXAM'),('5ab5488e48fa43a69d5340622ca952e1','e07acc2558134187b06118fe491d9251','9','对连续不断地会谈感到困难','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:46','root','2024-07-23 09:33:46','0','EXAM'),('5ba01686bbef4776a049b08f33eeef9b','22e2ce7ceab54f51acda0a556ae22ee8','3','吃药','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:18','root','2024-07-22 17:26:18','0','EXAM'),('5fe9a64839ca4a35bc53eb9b58859c34','47bf30aa596a45dda1ba0d2d2168c1c0','4','工作和兴趣  ','0','','无','提问时才诉述','自发地直接或间接表达对活动、工作或学习失去兴趣，如感到没精打彩，犹豫不决，不能坚持或需强迫自己去工作或活动','活动时间减少或成效下降，住院病人每天参加病房劳动或娱乐不满3小时','因目前的疾病而停止工作，住院者不参加任何活动或者没有他人帮助便不能完成病室日常事务','','A','10','无','2','root','2024-07-22 17:00:15','root','2024-07-22 17:00:15','0','EXAM'),('60a96d0275174f4eb90b881b78f9ecac','829aeed8e55c407a97ddf8d763ba58ac','4','您和同事：(只选一项)','0','','相互之间从不关心，只是点头之交','遇到困难可能稍微关心','有些同事很关心您','大多数同事都很关心您','','','A','10','无','2','root','2024-07-23 09:45:41','root','2024-07-23 09:45:41','0','EXAM'),('60fa8ae154d243e68e7e5da515f1a933','92728fd7d2a84f99930ab4ecf7102c76','7','你的工作能使你的朋友非常羡慕你','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:53','root','2024-07-23 09:51:53','0','EXAM'),('64fce8a56f7344f0a59023e30ac6ae70','f2e2e2358a5d45a8b665d64ff76a64d7','1','我觉得我可能将要发疯','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:11','root','2024-07-22 17:07:11','0','EXAM'),('65740f77844e40d3aba99c284992dbc5','fad663ea371f4250a81332bd3a346739','5','总睡眠质量（无论睡多长）','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','root','2024-07-22 16:27:14','root','2024-07-22 16:27:14','0','EXAM'),('66dc7b15ec1347f1b8163a73dfc9dc18','297c3414f85746d19849c53fefb61c0e','7','最近几个月里，你处于巅峰状态吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:23:02','root','2024-07-22 17:23:02','0','EXAM'),('6a916464217845e2bc14ca3fa9209b0d','eac721ca2d194ee487a936ecb493824a','4','您觉得脑子灵活、反应比平时快，或难以减慢您的思维？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:08','root','2024-07-22 17:13:08','0','EXAM'),('6d1664ab535e425d863fce2954c67d41','297c3414f85746d19849c53fefb61c0e','2','最近几个月里，你情绪很好吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:32','root','2024-07-22 17:22:32','0','EXAM'),('6dc1a8dc7fbd42b08b43c0d1d9da5d21','e07acc2558134187b06118fe491d9251','0','在社交场合，感到紧张','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:50','root','2024-07-23 09:33:50','0','EXAM'),('7067ff39d4cc446783389fb009e1b871','297c3414f85746d19849c53fefb61c0e','9','最近几个月里，你烦恼吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:23:13','root','2024-07-22 17:23:13','0','EXAM'),('761f37dd242148c089804d3a5d9ef2fb','f2e2e2358a5d45a8b665d64ff76a64d7','6','我觉得一切都很好，也不会发生什么不幸','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:09:18','root','2024-07-22 17:09:18','0','EXAM'),('76973018333a43ca89842ccd81af0dd6','f2e2e2358a5d45a8b665d64ff76a64d7','3','我手脚发抖打颤','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:23','root','2024-07-22 17:07:23','0','EXAM'),('78d78cd0a47b4ee2983542948cfcfee6','040e4b018d6b4b33a7c2455c37737af8','0','我感受到了我的情绪和情感，但我不必对它们做出反应','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:49:06','root','2024-07-23 09:49:06','0','EXAM'),('7d9c32eb603b4db187542cbfb719ab3d','e07acc2558134187b06118fe491d9251','6','时常伤害别人','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:19','root','2024-07-23 09:33:19','0','EXAM'),('7ffea753513a4df8866ca4cb819f5c90','297c3414f85746d19849c53fefb61c0e','3','最近几个月里，你像年轻时一样高兴吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:39','root','2024-07-22 17:22:39','0','EXAM'),('8083ca8087cb4ae6982f4ff16776566a','eac721ca2d194ee487a936ecb493824a','7','您很容易被身边的事物分散注意力，难集中注意力或难专注于一项工作？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:24','root','2024-07-22 17:13:24','0','EXAM'),('84f10e2390e8450bbb910b1980338674','22e2ce7ceab54f51acda0a556ae22ee8','9','吃饭','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:49','root','2024-07-22 17:26:49','0','EXAM'),('872529c7b9814256968a93e56f5d6a54','47bf30aa596a45dda1ba0d2d2168c1c0','5','阻滞（指思维和言语缓慢，注意力难以集中，主动性减退）  ','0','','无','精神检查中发现轻度阻滞','精神检查中发现明显阻滞','精神检查进行困难','完全不能回答问题（木僵）','','A','10','无','2','root','2024-07-22 17:00:21','root','2024-07-22 17:00:21','0','EXAM'),('8753f18598aa421791dfb36a5624f6b9','47bf30aa596a45dda1ba0d2d2168c1c0','6','躯体性焦虑（指焦虑的生理症状，包括：有时口干，腹胀，腹泻，打呃，腹绞痛，心悸，头痛，过度换气和叹气，以及尿频和出汗）  ','0','','无','轻度','中度，有肯定的上述状态','重度，上述症状严重影响生活或需要处理','严重影响生活和活动','','A','10','无','2','root','2024-07-22 17:00:28','root','2024-07-22 17:00:28','0','EXAM'),('8985b40b4c564454910fbfc7204f507a','92728fd7d2a84f99930ab4ecf7102c76','2','你的工作带有艺术性','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:27','root','2024-07-23 09:51:27','0','EXAM'),('8c7d54082a4847a9860a326efe89e6ba','297c3414f85746d19849c53fefb61c0e','4','最近几个月里，你所做的大多数事情都单调或令你厌烦吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:44','root','2024-07-22 17:22:44','0','EXAM'),('910cefd27a6643bc9879404e7c88e320','fad663ea371f4250a81332bd3a346739','6','白天情绪','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','root','2024-07-22 16:27:23','root','2024-07-22 16:27:23','0','EXAM'),('92b78197f3904c6d9e1a712636afbf82','040e4b018d6b4b33a7c2455c37737af8','1','在做事的时候，我经常走神，而且很容易被干扰','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:21','root','2024-07-23 09:48:21','0','EXAM'),('9303265bb4e541b5b9e72a83b1dcb500','47bf30aa596a45dda1ba0d2d2168c1c0','2','疑病  ','0','','无','对身体过分关注','反复考虑健康问题','有疑病妄想','伴幻觉的疑病妄想','','A','10','无','2','root','2024-07-22 16:59:59','root','2024-07-22 16:59:59','0','EXAM'),('9447c6644c3146449b3159223c40f654','92728fd7d2a84f99930ab4ecf7102c76','1','你的工作能使人感觉到你是团体中的一份子','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:22','root','2024-07-23 09:51:22','0','EXAM'),('991e6499e4394fae8a5cf551a097da9e','297c3414f85746d19849c53fefb61c0e','6','最近几个月里，过去你感兴趣做的事情，现在仍然乐在其中吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:55','root','2024-07-22 17:22:55','0','EXAM'),('99f7402fec2d47028a8bc0f08048ca8a','fad663ea371f4250a81332bd3a346739','7','白天身体功能（体力或精神：如记忆力、认知力和注意力等）','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','root','2024-07-22 16:27:29','root','2024-07-22 16:27:29','0','EXAM'),('9dc7f934128f4ad8a091eb3e78be4541','47bf30aa596a45dda1ba0d2d2168c1c0','7','自知力  ','0','','知道自己有病，表现为抑郁','知道自己有病，但归咎伙食太差，环境问题，工作过忙，病毒感染或需要休息','完全否认有病','','','','A','10','无','2','root','2024-07-22 17:00:33','root','2024-07-22 17:00:33','0','EXAM'),('a1aa38b4d20b4932b3094b60904649d2','22e2ce7ceab54f51acda0a556ae22ee8','6','穿衣','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:34','root','2024-07-22 17:26:34','0','EXAM'),('a32356f0ad234e9d9a65f25fc9b0c470','92728fd7d2a84f99930ab4ecf7102c76','4','不论你怎么干，你总能和大多数人一样晋级和加工资','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:37','root','2024-07-23 09:51:37','0','EXAM'),('a60c1799136b41feb6f53d8067f742ec','829aeed8e55c407a97ddf8d763ba58ac','0','从家庭成员得到的支持和照顾，如夫妻(恋人)','0','','无','极少','一般','全力支持','','','A','10','无','2','root','2024-07-23 09:46:10','root','2024-07-23 09:46:10','0','EXAM'),('a878e04b39604ad89ac0242690e6a47f','297c3414f85746d19849c53fefb61c0e','8','当你回顾一生时，感到相当满意吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:23:08','root','2024-07-22 17:23:08','0','EXAM'),('abce3f9df31b485194f9e0aa138cb68c','e07acc2558134187b06118fe491d9251','4','与异性来往感觉不自然','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:08','root','2024-07-23 09:33:08','0','EXAM'),('aee095a1a6864cc8a96b89e41dbdd62f','040e4b018d6b4b33a7c2455c37737af8','5','在洗澡时，我会留心于水淌过身体的感觉','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:40','root','2024-07-23 09:48:40','0','EXAM'),('b0462f500874494280f4e129f52aa476','829aeed8e55c407a97ddf8d763ba58ac','2','从家庭成员得到的支持和照顾，如父母','0','','无','极少','一般','全力支持','','','A','10','无','2','root','2024-07-23 09:43:17','root','2024-07-23 09:43:17','0','EXAM'),('b062205d2e5347ef89e8ea4fc334dae5','829aeed8e55c407a97ddf8d763ba58ac','3','从家庭成员得到的支持和照顾，如儿女','0','','无','极少','一般','全力支持','','','A','10','无','2','root','2024-07-23 09:45:36','root','2024-07-23 09:45:36','0','EXAM'),('b2bd6c1135dd45dda655640ef162c8e6','f2e2e2358a5d45a8b665d64ff76a64d7','8','我因为头痛、头颈痛和背痛而苦恼','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:09:29','root','2024-07-22 17:09:29','0','EXAM'),('b31c51b26cf344e58c1ac66b6f47f03d','040e4b018d6b4b33a7c2455c37737af8','4','我能清晰表达自己的信念、观点以及期望','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:35','root','2024-07-23 09:48:35','0','EXAM'),('b3615222e969463098bfdc98f7c0471e','040e4b018d6b4b33a7c2455c37737af8','8','我没有注意到我在做什么事情，这是因为我在做白日梦，在担忧或分心于外界','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:56','root','2024-07-23 09:48:56','0','EXAM'),('b4a52139232f4cd19840e6bfac8bb7de','040e4b018d6b4b33a7c2455c37737af8','9','我观察自己的情绪，而不迷失其中','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:49:01','root','2024-07-23 09:49:01','0','EXAM'),('b7c11283e3b74ed79e38c52c21b363ce','22e2ce7ceab54f51acda0a556ae22ee8','2','梳头、刷牙等','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:13','root','2024-07-22 17:26:13','0','EXAM'),('b9a4a229c4634e06b7c5196cdbb555ab','22e2ce7ceab54f51acda0a556ae22ee8','0','洗衣','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:55','root','2024-07-22 17:26:55','0','EXAM'),('bae81c1ca3c94ae8b73f1306f20dfe5c','f2e2e2358a5d45a8b665d64ff76a64d7','0','我感觉容易衰弱和疲乏','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:06','root','2024-07-22 17:07:06','0','EXAM'),('bc47e37a7ecb4aff985c0aba7c64226e','e07acc2558134187b06118fe491d9251','7','与一大群朋友在一起，常感到孤寂或失落','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:33:37','root','2024-07-23 09:33:37','0','EXAM'),('c1f91ed0a79f4d3193c0e4d06242bf61','829aeed8e55c407a97ddf8d763ba58ac','8','从家庭成员得到的支持和照顾，如兄弟姐妹','0','','无','极少','一般','全力支持','','','A','10','无','2','root','2024-07-23 09:46:01','root','2024-07-23 09:46:01','0','EXAM'),('c2a1733c473f41ee9efb55670442baee','829aeed8e55c407a97ddf8d763ba58ac','7','从家庭成员得到的支持和照顾，如其他成员(如嫂子)','0','','无','极少','一般','全力支持','','','A','10','无','2','root','2024-07-23 09:45:56','root','2024-07-23 09:45:56','0','EXAM'),('c434784aea6b46669d579d0006706bb1','297c3414f85746d19849c53fefb61c0e','5','今年一些小事使你烦恼吗？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:49','root','2024-07-22 17:22:49','0','EXAM'),('c85c2891a215420c9c2c687acbef4e32','040e4b018d6b4b33a7c2455c37737af8','3','我告诉自己，我不应该以我现在的这种方式来感受此时的情感','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:29','root','2024-07-23 09:48:29','0','EXAM'),('ca6f8f061c9c4535b824010b0404b525','eac721ca2d194ee487a936ecb493824a','6','您的精力比平时好？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:19','root','2024-07-22 17:13:19','0','EXAM'),('ce7811f3e9a94712ae9a9424b9aee152','22e2ce7ceab54f51acda0a556ae22ee8','4','洗澡','0','','自己完全可以做','有些困难','需要帮助','根本无法做','','','A','10','无','2','root','2024-07-22 17:26:23','root','2024-07-22 17:26:23','0','EXAM'),('d80dc0fac9cd4f51a30019e7a6d15ba1','f2e2e2358a5d45a8b665d64ff76a64d7','5','我觉得心平气和，并且容易安静坐着','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:07:34','root','2024-07-22 17:07:34','0','EXAM'),('dd09a61b676f4602bccd11fd025c9ec6','eac721ca2d194ee487a936ecb493824a','9','您比平时积极主动，或比平时做了更多的事情？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:35','root','2024-07-22 17:13:35','0','EXAM'),('e34926a94a4a4895817d7ea78aa63012','fad663ea371f4250a81332bd3a346739','1','入睡时间（关灯后到睡着的时间）','0','','没问题\n','轻微延迟','显著延迟','延迟严重或没有睡觉','','','A','12','无','2','admin','2018-12-09 20:30:07','root','2024-07-22 16:26:17','0','EXAM'),('e568959322d44c998f382277e1b34c0d','829aeed8e55c407a97ddf8d763ba58ac','1','您遇到烦恼时的倾诉方式：(只选一项)','0','','从不向任何人诉说','只向关系极为密切的1－2个人诉说','如果朋友主动询问您会说出来','主动诉说自己的烦恼，以获得支持和理解','','','A','10','无','2','root','2024-07-23 09:43:13','root','2024-07-23 09:43:13','0','EXAM'),('e718ffa946124cad86d984d043b12e69','eac721ca2d194ee487a936ecb493824a','1','您比平时喜欢社交或外出，如在半夜仍给朋友打电话？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:12:52','root','2024-07-22 17:12:52','0','EXAM'),('e8a3bfc670d44f4a913478343429bb13','47bf30aa596a45dda1ba0d2d2168c1c0','0','人格解体或现实解体（指非真实感或虚无妄想）  ','0','','无','问及时才诉述','自然诉述','有虚无妄想','伴幻觉的虚无妄想','','A','10','无','2','root','2024-07-22 17:00:51','root','2024-07-22 17:00:51','0','EXAM'),('eb0125bf83cf404697a774ed33aa4256','f2e2e2358a5d45a8b665d64ff76a64d7','7','我觉得心跳很快','0','','没有或很少时间','小部分时间','相当多时间','绝大部分或全部时间','','','A','10','无','2','root','2024-07-22 17:09:24','root','2024-07-22 17:09:24','0','EXAM'),('ec92e9874c984f0e8530b666a9c34df7','297c3414f85746d19849c53fefb61c0e','0','如果你能随便选择自己的住处的话，你愿意选择哪里？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:23:19','root','2024-07-22 17:23:19','0','EXAM'),('f3b9d81dfa514a87b9f949d7529a73fd','92728fd7d2a84f99930ab4ecf7102c76','5','你的工作使你有可能经常变换工作地点、工作场所或工作方式','0','','非常重要','比较重要','较不重要','很不重要','','','A','10','无','2','root','2024-07-23 09:51:42','root','2024-07-23 09:51:42','0','EXAM'),('f446c4a105be4081873a5aed9baf9a4d','040e4b018d6b4b33a7c2455c37737af8','2','我留意到食物和饮料是如何影响着我的想法、身体的感觉和情绪的','0','','完全符合','非常符合','有些符合','较少符合','一点也不符合','','A','10','无','2','root','2024-07-23 09:48:25','root','2024-07-23 09:48:25','0','EXAM'),('f7ea54c4da58425a9fb42053b608623b','297c3414f85746d19849c53fefb61c0e','1','最近几个月里，有时你感到活着没意思？','0','','是','否','不知道','','','','A','10','无','2','root','2024-07-22 17:22:28','root','2024-07-22 17:22:28','0','EXAM'),('f9fce01ba0f3488d830b0e1b3fdd53a6','eac721ca2d194ee487a936ecb493824a','3','您做了一些平时不会做的事情，别人认为那些事情有些过分、愚蠢或冒险？','0','','是','否','','','','','A','10','无','2','root','2024-07-22 17:13:02','root','2024-07-22 17:13:02','0','EXAM'),('feaec8da484e4e71b045fa3c1bbfc09a','e07acc2558134187b06118fe491d9251','2','极易受窘','0','','是','否','','','','','A','10','无','2','root','2024-07-23 09:32:58','root','2024-07-23 09:32:58','0','EXAM');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER before_insert_examination
    BEFORE INSERT ON subject
    FOR EACH ROW
BEGIN
    IF NEW.id IS NULL THEN
        SET NEW.id = UUID();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subject_bank`
--

DROP TABLE IF EXISTS `subject_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_bank` (
  `id` varchar(64) NOT NULL,
  `category_id` varchar(64) DEFAULT NULL COMMENT '分类ID',
  `serial_number` varchar(62) DEFAULT NULL COMMENT '题目序号',
  `subject_name` varchar(255) DEFAULT NULL COMMENT '题目名称',
  `type` varchar(64) DEFAULT NULL COMMENT '题目类型',
  `content` varchar(255) DEFAULT NULL COMMENT '题目内容',
  `option_a` varchar(255) DEFAULT NULL COMMENT '选项a',
  `option_b` varchar(255) DEFAULT NULL COMMENT '选项b',
  `option_c` varchar(255) DEFAULT NULL COMMENT '选项c',
  `option_d` varchar(255) DEFAULT NULL COMMENT '选项d',
  `option_e` varchar(255) DEFAULT NULL COMMENT '选项e',
  `option_f` varchar(255) DEFAULT NULL COMMENT '选项f',
  `answer` varchar(255) DEFAULT NULL COMMENT '参考答案',
  `score` varchar(64) DEFAULT NULL COMMENT '分值',
  `analysis` varchar(255) DEFAULT NULL COMMENT '解析',
  `level` varchar(64) DEFAULT NULL COMMENT '难度等级',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_bank`
--

LOCK TABLES `subject_bank` WRITE;
/*!40000 ALTER TABLE `subject_bank` DISABLE KEYS */;
INSERT INTO `subject_bank` VALUES ('2612f127f8e74736a086e9ec18850852','700556b5becd4091821644a5288d489c',NULL,'232222','0','','323fffff','32','32','323','','','2','323','323','2','admin','2018-12-09 14:38:47','admin','2018-12-09 14:49:43','1','EXAM'),('3600225f10114e40a07e4312d3f7f8ad','700556b5becd4091821644a5288d489c','1','1','0','','1','1','1','1','','','B','1','1','2','admin','2019-01-09 21:11:34','admin','2019-03-06 13:58:54','0','EXAM'),('494fb828f270450690a82f23450f138f','700556b5becd4091821644a5288d489c','323','23','0','','323','323','323','233','','','B','323','323','2','admin','2019-01-09 18:03:22','admin','2019-01-09 18:03:22','1','EXAM'),('aeff7c505e374cbdbcecf79e7a587ddd','','1','33','0','','33','33','33','33','','','3','4','333','4','admin','2018-12-09 14:47:02','admin','2019-01-09 17:45:30','1','EXAM'),('b1058acf24184bfd8c85c61d59dfdfd0','c664646337c345ac8a91e3b024ded8bb',NULL,'操作系统','0','','操作系统','操作系统','操作系统','操作系统','','','1','操作系统','操作系统','2','admin','2018-12-09 20:26:59','admin','2018-12-09 20:27:05','1','EXAM'),('f8cf3298c59045929c4c108251c66eb7','c664646337c345ac8a91e3b024ded8bb',NULL,'434','0','','434','434','343','4434','','','2','434','434','2','admin','2018-12-09 20:27:32','admin','2018-12-09 20:27:32','1','EXAM');
/*!40000 ALTER TABLE `subject_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_category`
--

DROP TABLE IF EXISTS `subject_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_category` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `category_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `category_desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父分类ID',
  `sort` varchar(64) DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_category`
--

LOCK TABLES `subject_category` WRITE;
/*!40000 ALTER TABLE `subject_category` DISABLE KEYS */;
INSERT INTO `subject_category` VALUES ('047a8dd7d0614314a72750af9915ada0','大学语文',NULL,'-1','6','admin','2018-12-06 20:37:38','admin','2018-12-06 20:44:44','0','EXAM'),('103cf01d23574c93b88a4aff2a350471','四级',NULL,'412a93a6e1ac49a59e66da0721c183cd','1','admin','2018-12-09 20:32:08','admin','2018-12-09 20:32:08','1','EXAM'),('412a93a6e1ac49a59e66da0721c183cd','大学英语','大学英语','-1','2','admin','2018-12-06 20:37:29','admin','2018-12-06 20:44:25','0','EXAM'),('577ff5e3a9b345e18d40e505cc631110','国际金融',NULL,'-1','5','admin','2018-12-06 20:38:30','admin','2018-12-06 20:44:40','0','EXAM'),('700556b5becd4091821644a5288d489c','架构基础','4343434','aceeeb30b57f4d6982cd37682b5b7522','1','admin','2018-12-06 20:45:06','admin','2019-03-06 13:59:01','0','EXAM'),('9fdbb0add5354249a8a2d530bdd48d08','高等数学',NULL,'-1','3','admin','2018-12-06 20:37:45','admin','2018-12-06 20:44:31','0','EXAM'),('aceeeb30b57f4d6982cd37682b5b7522','计算机',NULL,'-1','1','admin','2018-12-06 20:41:44','admin','2018-12-06 20:44:09','0','EXAM'),('c664646337c345ac8a91e3b024ded8bb','操作系统',NULL,'aceeeb30b57f4d6982cd37682b5b7522','2','admin','2018-12-06 20:45:21','admin','2018-12-06 20:45:21','0','EXAM'),('caf8805fc7dc481b98d08ab13e5c5234','数据库',NULL,'aceeeb30b57f4d6982cd37682b5b7522','3','admin','2018-12-06 20:45:34','admin','2018-12-06 20:45:34','0','EXAM'),('dbc710d2af704f8b88488ae2b7e63d9e','5555',NULL,'-1','30','admin','2018-12-09 21:04:56','admin','2018-12-09 21:04:56','1','EXAM'),('e11504263fef456997b24d7db0a86c4c','六级',NULL,'412a93a6e1ac49a59e66da0721c183cd','2','admin','2018-12-09 20:32:16','admin','2018-12-09 20:32:16','1','EXAM'),('ffe1d4053ae4475bb39aacd6699d37c4','应用数学',NULL,'-1','4','admin','2018-12-06 20:38:20','admin','2018-12-06 20:44:36','0','EXAM');
/*!40000 ALTER TABLE `subject_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-24 22:17:42
