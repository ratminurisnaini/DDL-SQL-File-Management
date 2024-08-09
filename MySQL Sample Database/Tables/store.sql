CREATE TABLE `store`  (
  `store_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `manager_staff_id` tinyint UNSIGNED NOT NULL,
  `address_id` smallint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`) USING BTREE,
  UNIQUE INDEX `idx_unique_manager`(`manager_staff_id`) USING BTREE,
  INDEX `idx_fk_address_id`(`address_id`) USING BTREE,
  CONSTRAINT `fk_store_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_store_staff` FOREIGN KEY (`manager_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;