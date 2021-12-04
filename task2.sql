CREATE TABLE IF NOT EXISTS `Students` (
	  `StudentId` INT(6) NOT NULL AUTO_INCREMENT,
  	`FirstName` VARCHAR(256) NOT NULL,
    `LastName` VARCHAR(256) NOT NULL,
  	`Group` VARCHAR(256) NOT NULL,
    PRIMARY KEY(`StudentId`)
);

CREATE TABLE IF NOT EXISTS `Exams` (
	  `StudentId` INT(6) NOT NULL,
  	`ExamName` VARCHAR(256) NOT NULL,
  	`Result` INT(1) NOT NULL
);

 /*Запрос про оценки*/
 
 SELECT DISTINCT `FirstName`, `LastName`, `Group` FROM `Students` s JOIN(
  	SELECT `StudentId`, `ExamName`, `Result` FROM `Exams` WHERE `Result` < 3
  ) as e ON
  s.StudentId = e.StudentId
  GROUP BY e.StudentId
  HAVING COUNT(*) > 2;
  
/*Запрос про группы*/  

 CREATE OR REPLACE VIEW `Groups` AS
 	 SELECT `Group` FROM `Students` s JOIN(
        SELECT `StudentId`, `Result` FROM `Exams` WHERE `Result` < 3
  ) as e ON
  s.StudentId = e.StudentId
  GROUP BY e.StudentId
  HAVING COUNT(*) > 2;
  
  SELECT DISTINCT `Group` FROM `Groups`
  GROUP BY `Group` HAVING COUNT(*) > 10;