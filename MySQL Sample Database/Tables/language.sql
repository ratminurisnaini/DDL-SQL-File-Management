CREATE TABLE `language`  (
  `language_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;