-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 12, 2016 at 11:22 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `crowdsourcing`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `assignedtask`
-- 

CREATE TABLE `assignedtask` (
  `id` int(11) NOT NULL auto_increment,
  `workerid` int(11) default NULL,
  `taskid` int(11) default NULL,
  `amount` int(11) default '0',
  `rating` float default NULL,
  `comments` varchar(200) default NULL,
  `status` int(11) default NULL COMMENT '0 - In Progress1 - Completed, 2-Paid,Rated and commented',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `assignedtask`
-- 

INSERT INTO `assignedtask` VALUES (1, 1, 1, 400, 1, 'sadsa', 2);
INSERT INTO `assignedtask` VALUES (2, 3, 3, 700, 0.6, 'vccccccccccccc', 2);
INSERT INTO `assignedtask` VALUES (3, 3, 5, 0, 0, '', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `class` varchar(25) default NULL,
  `status` int(11) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Dumping data for table `categories`
-- 

INSERT INTO `categories` VALUES (1, 'Marketing', 'fa-desktop', 1);
INSERT INTO `categories` VALUES (2, 'IT & Programming', 'fa-laptop', 1);
INSERT INTO `categories` VALUES (3, 'Hospital', 'fa-hospital-o', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `experties`
-- 

CREATE TABLE `experties` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  `userid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- 
-- Dumping data for table `experties`
-- 

INSERT INTO `experties` VALUES (12, 'Java', 1);
INSERT INTO `experties` VALUES (15, 'C#', 3);
INSERT INTO `experties` VALUES (16, 'Java', 4);
INSERT INTO `experties` VALUES (17, 'C#', 4);
INSERT INTO `experties` VALUES (18, 'PHP', 4);
INSERT INTO `experties` VALUES (19, 'Sales', 3);
INSERT INTO `experties` VALUES (20, 'Java', 3);
INSERT INTO `experties` VALUES (21, 'HTML', 3);
INSERT INTO `experties` VALUES (22, 'Media', 3);
INSERT INTO `experties` VALUES (23, '', 9);
INSERT INTO `experties` VALUES (24, 'c#', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `invitations`
-- 

CREATE TABLE `invitations` (
  `id` int(11) NOT NULL auto_increment,
  `taskid` int(11) default NULL,
  `clientid` int(11) default NULL,
  `workerid` int(11) default NULL,
  `acceptStatus` int(11) default NULL COMMENT '0 - Pending\n1 - Accept\n2 - Reject',
  `createdon` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Dumping data for table `invitations`
-- 

INSERT INTO `invitations` VALUES (1, 5, 2, 1, 2, '2016-04-12 11:04:08');
INSERT INTO `invitations` VALUES (2, 5, 2, 3, 1, '2016-04-12 11:05:58');

-- --------------------------------------------------------

-- 
-- Table structure for table `messages`
-- 

CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `sender` int(11) default NULL,
  `receiver` int(11) default NULL,
  `subject` varchar(250) default NULL,
  `message` varchar(255) default NULL,
  `status` int(11) default '0',
  `createdon` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

-- 
-- Dumping data for table `messages`
-- 

INSERT INTO `messages` VALUES (1, 2, 1, 'Job Offer', 'Dear Worker,<br>Your recieved an offer of a work task 1 by a worker 2. Please look at your invitations and respond accordinly.', 1, '2016-04-11 21:43:54');
INSERT INTO `messages` VALUES (2, 1, 2, 'Offer Rejected', 'Dear Client,<br>Your offer for work task 1 has been rejected by worker 1', 1, '2016-04-11 21:45:34');
INSERT INTO `messages` VALUES (3, 2, 1, 'Job Offer', 'Dear Worker,<br>Your recieved an offer of a work task 1 by a worker 2. Please look at your invitations and respond accordinly.', 1, '2016-04-11 21:46:28');
INSERT INTO `messages` VALUES (4, 1, 2, 'Offer Accepted', 'Dear Client,<br>Your offer for work task 1 has been accepted by worker 1', 1, '2016-04-11 21:46:39');
INSERT INTO `messages` VALUES (5, 1, 2, 'Task has been completed', 'Dear Client,<br>Your task 1 has been completed by worker 1', 1, '2016-04-11 21:48:39');
INSERT INTO `messages` VALUES (6, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br>Your have been paid for task 1by client 2', 1, '2016-04-11 21:59:36');
INSERT INTO `messages` VALUES (7, 2, 3, 'Job Offer', 'Dear Worker,<br>Your recieved an offer of a work task 3 by a worker 2. Please look at your invitations and respond accordinly.', 1, '2016-04-11 22:44:43');
INSERT INTO `messages` VALUES (8, 3, 2, 'Offer Accepted', 'Dear Client,<br>Your offer for work task 3 has been accepted by worker 3', 1, '2016-04-11 22:57:40');
INSERT INTO `messages` VALUES (9, 3, 2, 'Task has been completed', 'Dear Client,<br>Your task 3 has been completed by worker 3', 1, '2016-04-11 22:59:02');
INSERT INTO `messages` VALUES (10, 2, 3, 'Task has been rated and paid', 'Dear Worker,<br>Your have been paid for task 3by client 2', 1, '2016-04-11 23:02:59');
INSERT INTO `messages` VALUES (11, 2, 3, 'Task has been rated and paid', 'Dear Worker,<br>Your have been paid for task 3by client 2', 1, '2016-04-12 02:24:47');
INSERT INTO `messages` VALUES (12, 2, 3, 'Task has been rated and paid', 'Dear Worker,<br>Your have been paid for task 3by client 2', 1, '2016-04-12 02:29:22');
INSERT INTO `messages` VALUES (13, 2, 3, 'Task has been rated and paid', 'Dear Worker,<br>Your have been paid for task 3by client 2', 1, '2016-04-12 02:30:57');
INSERT INTO `messages` VALUES (14, 1, 2, 'Task has been completed', 'Dear Client,<br>Your task has been completed by worker Khurram Shahzad', 1, '2016-04-12 05:59:19');
INSERT INTO `messages` VALUES (15, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:02:45');
INSERT INTO `messages` VALUES (16, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:06:10');
INSERT INTO `messages` VALUES (17, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:11:26');
INSERT INTO `messages` VALUES (18, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:12:45');
INSERT INTO `messages` VALUES (19, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:13:34');
INSERT INTO `messages` VALUES (20, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:15:13');
INSERT INTO `messages` VALUES (21, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:16:43');
INSERT INTO `messages` VALUES (22, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:17:38');
INSERT INTO `messages` VALUES (23, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:24:22');
INSERT INTO `messages` VALUES (24, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:28:29');
INSERT INTO `messages` VALUES (25, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:32:52');
INSERT INTO `messages` VALUES (26, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:39:42');
INSERT INTO `messages` VALUES (27, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:57:26');
INSERT INTO `messages` VALUES (28, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 06:58:27');
INSERT INTO `messages` VALUES (29, 2, 1, 'Task has been rated and paid', 'Dear Worker,<br><br>Your have been paid for a task by client bhawna sharma', 1, '2016-04-12 07:00:03');
INSERT INTO `messages` VALUES (30, 2, 1, 'Job Offer', 'Dear Worker,<br><br>Your recieved an offer of a work task by a client bhawna sharma. Please look at your invitations and respond accordinly.', 1, '2016-04-12 11:04:08');
INSERT INTO `messages` VALUES (31, 1, 2, 'Offer Rejected', 'Dear Client,<br><br>Your offer for work task has been rejected by worker Khurram Shahzad', 1, '2016-04-12 11:05:16');
INSERT INTO `messages` VALUES (32, 1, 2, 'Offer Rejected', 'Dear Client,<br><br>Your offer for work task has been rejected by worker Khurram Shahzad', 1, '2016-04-12 11:05:27');
INSERT INTO `messages` VALUES (33, 2, 3, 'Job Offer', 'Dear Worker,<br><br>Your recieved an offer of a work task by a client bhawna sharma. Please look at your invitations and respond accordinly.', 1, '2016-04-12 11:05:58');
INSERT INTO `messages` VALUES (34, 3, 2, 'Offer Accepted', 'Dear Client,<br>Your offer for work task has been accepted by worker Alex Smith', 1, '2016-04-12 11:06:42');
INSERT INTO `messages` VALUES (35, 3, 2, 'Task has been completed', 'Dear Client,<br>Your task has been completed by worker Alex Smith', 1, '2016-04-12 11:07:29');

-- --------------------------------------------------------

-- 
-- Table structure for table `paymentaccounts`
-- 

CREATE TABLE `paymentaccounts` (
  `id` int(11) NOT NULL auto_increment,
  `paymentmethod` varchar(20) NOT NULL,
  `cardtype` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `cardexpirymonth` int(11) NOT NULL,
  `cardexpiryyear` int(11) NOT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `paymentaccounts`
-- 

INSERT INTO `paymentaccounts` VALUES (1, 'creditcard', 'Visa', '1234567881232432', '1234567881232432', 'Bhawna Sharma', 6, 2017, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `tasks`
-- 

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `details` text,
  `location` varchar(50) default NULL,
  `experties` varchar(45) default NULL,
  `uid` int(11) default NULL,
  `status` tinyint(4) default NULL,
  `catid` int(11) default NULL,
  `numworkers` int(11) default NULL,
  `price` int(11) default NULL,
  `publisheddate` varchar(20) default NULL,
  `expireddate` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `tasks`
-- 

INSERT INTO `tasks` VALUES (1, 'library system ', 'I need a library management system which should be in the form of website for customer.  Customers should be able to see the available book and reserve to get  them personally.\r\n\r\nFor more information Please contact at following email:\r\nbhawna@yahoo.com. \r\n\r\n\r\n\r\n', 'montreal', 'java', 2, 1, 2, 1, 400, '2016-04-11 21:39:27', '2016-04-15 23:59:59');
INSERT INTO `tasks` VALUES (5, 'Driver Needed', 'dsfdsfds', 'Montreal', 'C#', 2, 0, 3, 1, 100, '2016-04-19 00:00:00', '2016-04-19 23:59:59');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `firstname` varchar(50) default NULL,
  `lastname` varchar(50) default NULL,
  `phone` varchar(20) default NULL,
  `location` varchar(30) default NULL,
  `status` tinyint(1) default NULL,
  `hourRate` int(11) default NULL,
  `pic` varchar(45) default NULL,
  `usertype` int(11) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `createdon` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (1, 'shezee611@gmail.com', 'khurram', 'Khurram', 'Shahzad', '1234567891', 'montreal', 1, 100, NULL, 2, '2016-04-01 00:00:00', '2016-04-20 00:00:00', '2016-04-11 21:23:49');
INSERT INTO `users` VALUES (2, 'bhawna@yahoo.com', 'bhawna', 'bhawna', 'sharma', '1234567891', 'montreal', 1, 100, NULL, 1, '2000-10-10 00:00:00', '2000-10-10 00:00:00', '2016-04-11 21:31:55');
INSERT INTO `users` VALUES (3, 'alex@yahoo.com', 'alex', 'Alex', 'Smith', '1223213', 'montreal', 1, 90, NULL, 2, '2016-01-01 00:00:00', '2020-01-01 00:00:00', '2016-04-11 22:17:15');
INSERT INTO `users` VALUES (4, 'steve@yahoo.com', 'steve', 'Steven', 'Stuart', '1233232', 'Montreal', 1, 70, NULL, 2, '2016-04-11 00:00:00', '2016-04-20 00:00:00', '2016-04-11 23:07:03');
INSERT INTO `users` VALUES (9, 'jack@yahoo.com', 'jack', 'Jacob', 'Joan', '232323223', 'Montreal', 1, 0, NULL, 2, '2016-01-01 00:00:00', '2020-01-01 00:00:00', '2016-04-12 10:21:07');
