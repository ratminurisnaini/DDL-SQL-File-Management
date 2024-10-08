CREATE TABLE `film`  (
  `film_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `release_year` year NULL DEFAULT NULL,
  `language_id` tinyint UNSIGNED NOT NULL,
  `original_language_id` tinyint UNSIGNED NULL DEFAULT NULL,
  `rental_duration` tinyint UNSIGNED NOT NULL DEFAULT 3,
  `rental_rate` decimal(4, 2) NOT NULL DEFAULT 4.99,
  `length` smallint UNSIGNED NULL DEFAULT NULL,
  `replacement_cost` decimal(5, 2) NOT NULL DEFAULT 19.99,
  `rating` enum('G','PG','PG-13','R','NC-17') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_fk_language_id`(`language_id`) USING BTREE,
  INDEX `idx_fk_original_language_id`(`original_language_id`) USING BTREE,
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;