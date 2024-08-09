CREATE TABLE `rental`  (
  `rental_id` int NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL,
  `inventory_id` mediumint UNSIGNED NOT NULL,
  `customer_id` smallint UNSIGNED NOT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `staff_id` tinyint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rental_id`) USING BTREE,
  UNIQUE INDEX `rental_date`(`rental_date`, `inventory_id`, `customer_id`) USING BTREE,
  INDEX `idx_fk_inventory_id`(`inventory_id`) USING BTREE,
  INDEX `idx_fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_fk_staff_id`(`staff_id`) USING BTREE,
  CONSTRAINT `fk_rental_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;