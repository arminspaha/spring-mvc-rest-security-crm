DROP DATABASE  IF EXISTS `spring_security_demo_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo_bcrypt`;
USE `spring_security_demo_bcrypt`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.dailycred.com/article/bcrypt-calculator
--
-- Default passwords are: test123
--

INSERT INTO `users` 
VALUES 
('employee','{bcrypt}$2a$04$Db5KWqKHpsAYD9KFU8Xp2OIdyP3OaozRymW9refvUiimzSET3KuxC',1),
('manager','{bcrypt}$2a$04$4NK1N41BpUV4mGWEA9/CreFlsaDqfqSAKhgYt1D/H5LVi3gBne/b6',1),
('admin','{bcrypt}$2a$04$oXhqrK.YKDhc6EbpOz.MXOP5LQb.S8Uc27fv1GV7jVEI8sqi7yWfe',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('employee','ROLE_EMPLOYEE'),
('manager','ROLE_EMPLOYEE'),
('manager','ROLE_MANAGER'),
('admin','ROLE_EMPLOYEE'),
('admin','ROLE_ADMIN');


