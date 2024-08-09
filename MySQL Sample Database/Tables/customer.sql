CREATE TABLE `customer`  (
  `customer_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` tinyint UNSIGNED NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address_id` smallint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `create_date` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `idx_fk_store_id`(`store_id`) USING BTREE,
  INDEX `idx_fk_address_id`(`address_id`) USING BTREE,
  INDEX `idx_last_name`(`last_name`) USING BTREE,
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 600 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;