CREATE TABLE `payment`  (
  `payment_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` smallint UNSIGNED NOT NULL,
  `staff_id` tinyint UNSIGNED NOT NULL,
  `rental_id` int NULL DEFAULT NULL,
  `amount` decimal(5, 2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`) USING BTREE,
  INDEX `idx_fk_staff_id`(`staff_id`) USING BTREE,
  INDEX `idx_fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `fk_payment_rental`(`rental_id`) USING BTREE,
  CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;