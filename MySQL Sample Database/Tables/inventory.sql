CREATE TABLE `inventory`  (
  `inventory_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` smallint UNSIGNED NOT NULL,
  `store_id` tinyint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`) USING BTREE,
  INDEX `idx_fk_film_id`(`film_id`) USING BTREE,
  INDEX `idx_store_id_film_id`(`store_id`, `film_id`) USING BTREE,
  CONSTRAINT `fk_inventory_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4582 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;