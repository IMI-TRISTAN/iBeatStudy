

CREATE TABLE `Status` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` text
);

CREATE TABLE `Student` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` text,
  `email` text,
  `password` text
);

CREATE TABLE `Dataset` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` text DEFAULT "QC",
  `name` text
);



CREATE TABLE `Patient` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `QC_dataset_id` int,
  `Seg_dataset_id` int,
  FOREIGN KEY (`QC_dataset_id`) REFERENCES `Dataset` (`id`);
  FOREIGN KEY (`Seg_dataset_id`) REFERENCES `Dataset` (`id`)
);


CREATE TABLE `Report` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` text,
  `dataset_id` int
  FOREIGN KEY (`dataset_id`) REFERENCES `Dataset` (`id`)
);

CREATE TABLE `Job` (
  `id` int UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `student_id` int,
  `patient_id` int,
  `dataset_id` int,
  `status_id` id,
  `report_id` int,
  `start_date` datetime DEFAULT (now()),
  `deadline_date` datetime
   FOREIGN KEY (`student_id`) REFERENCES `Student` (`id`)
   FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`id`)
   FOREIGN KEY (`dataset_id`) REFERENCES `Dataset` (`id`)
   FOREIGN KEY (`status_id`) REFERENCES `Status` (`id`)
   FOREIGN KEY (`report_id`) REFERENCES `Report` (`id`)
);



