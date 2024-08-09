/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : sakila

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 07/08/2024 13:01:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor`  (
  `actor_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`) USING BTREE,
  INDEX `idx_actor_last_name`(`last_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `address_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city_id` smallint UNSIGNED NOT NULL,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`) USING BTREE,
  INDEX `idx_fk_city_id`(`city_id`) USING BTREE,
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 606 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `city_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` smallint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`) USING BTREE,
  INDEX `idx_fk_country_id`(`country_id`) USING BTREE,
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `country_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
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

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS `film`;
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

-- ----------------------------
-- Table structure for film_actor
-- ----------------------------
DROP TABLE IF EXISTS `film_actor`;
CREATE TABLE `film_actor`  (
  `actor_id` smallint UNSIGNED NOT NULL,
  `film_id` smallint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`actor_id`, `film_id`) USING BTREE,
  INDEX `idx_fk_film_id`(`film_id`) USING BTREE,
  CONSTRAINT `fk_film_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for film_category
-- ----------------------------
DROP TABLE IF EXISTS `film_category`;
CREATE TABLE `film_category`  (
  `film_id` smallint UNSIGNED NOT NULL,
  `category_id` tinyint UNSIGNED NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`, `category_id`) USING BTREE,
  INDEX `fk_film_category_category`(`category_id`) USING BTREE,
  CONSTRAINT `fk_film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for film_text
-- ----------------------------
DROP TABLE IF EXISTS `film_text`;
CREATE TABLE `film_text`  (
  `film_id` smallint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`film_id`) USING BTREE,
  FULLTEXT INDEX `idx_title_description`(`title`, `description`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
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

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `language_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
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

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
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

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staff_id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address_id` smallint UNSIGNED NOT NULL,
  `picture` blob NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `store_id` tinyint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`) USING BTREE,
  INDEX `idx_fk_store_id`(`store_id`) USING BTREE,
  INDEX `idx_fk_address_id`(`address_id`) USING BTREE,
  CONSTRAINT `fk_staff_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
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

-- ----------------------------
-- View structure for actor_info
-- ----------------------------
DROP VIEW IF EXISTS `actor_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `actor_info` AS SELECT
a.actor_id,
a.first_name,
a.last_name,
GROUP_CONCAT(DISTINCT CONCAT(c.name, ': ',
		(SELECT GROUP_CONCAT(f.title ORDER BY f.title SEPARATOR ', ')
                    FROM sakila.film f
                    INNER JOIN sakila.film_category fc
                      ON f.film_id = fc.film_id
                    INNER JOIN sakila.film_actor fa
                      ON f.film_id = fa.film_id
                    WHERE fc.category_id = c.category_id
                    AND fa.actor_id = a.actor_id
                 )
             )
             ORDER BY c.name SEPARATOR '; ')
AS film_info
FROM sakila.actor a
LEFT JOIN sakila.film_actor fa
  ON a.actor_id = fa.actor_id
LEFT JOIN sakila.film_category fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila.category c
  ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name, a.last_name; ;

-- ----------------------------
-- View structure for customer_list
-- ----------------------------
DROP VIEW IF EXISTS `customer_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `customer_list` AS SELECT cu.customer_id AS ID, CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, a.address AS address, a.postal_code AS `zip code`,
	a.phone AS phone, city.city AS city, country.country AS country, IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, cu.store_id AS SID
FROM customer AS cu JOIN address AS a ON cu.address_id = a.address_id JOIN city ON a.city_id = city.city_id
	JOIN country ON city.country_id = country.country_id; ;

-- ----------------------------
-- View structure for film_list
-- ----------------------------
DROP VIEW IF EXISTS `film_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `film_list` AS SELECT film.film_id AS FID, film.title AS title, film.description AS description, category.name AS category, film.rental_rate AS price,
	film.length AS length, film.rating AS rating, GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM film LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id LEFT
JOIN film_actor ON film.film_id = film_actor.film_id LEFT JOIN actor ON
  film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name; ;

-- ----------------------------
-- View structure for nicer_but_slower_film_list
-- ----------------------------
DROP VIEW IF EXISTS `nicer_but_slower_film_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `nicer_but_slower_film_list` AS SELECT film.film_id AS FID, film.title AS title, film.description AS description, category.name AS category, film.rental_rate AS price,
	film.length AS length, film.rating AS rating, GROUP_CONCAT(CONCAT(CONCAT(UCASE(SUBSTR(actor.first_name,1,1)),
	LCASE(SUBSTR(actor.first_name,2,LENGTH(actor.first_name))),_utf8mb4' ',CONCAT(UCASE(SUBSTR(actor.last_name,1,1)),
	LCASE(SUBSTR(actor.last_name,2,LENGTH(actor.last_name)))))) SEPARATOR ', ') AS actors
FROM film LEFT JOIN film_category ON film_category.film_id = film.film_id
LEFT JOIN category ON category.category_id = film_category.category_id LEFT
JOIN film_actor ON film.film_id = film_actor.film_id LEFT JOIN actor ON
  film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name; ;

-- ----------------------------
-- View structure for sales_by_film_category
-- ----------------------------
DROP VIEW IF EXISTS `sales_by_film_category`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_film_category` AS SELECT
c.name AS category
, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_sales DESC; ;

-- ----------------------------
-- View structure for sales_by_store
-- ----------------------------
DROP VIEW IF EXISTS `sales_by_store`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sales_by_store` AS SELECT
CONCAT(c.city, _utf8mb4',', cy.country) AS store
, CONCAT(m.first_name, _utf8mb4' ', m.last_name) AS manager
, SUM(p.amount) AS total_sales
FROM payment AS p
INNER JOIN rental AS r ON p.rental_id = r.rental_id
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN store AS s ON i.store_id = s.store_id
INNER JOIN address AS a ON s.address_id = a.address_id
INNER JOIN city AS c ON a.city_id = c.city_id
INNER JOIN country AS cy ON c.country_id = cy.country_id
INNER JOIN staff AS m ON s.manager_staff_id = m.staff_id
GROUP BY s.store_id
ORDER BY cy.country, c.city; ;

-- ----------------------------
-- View structure for staff_list
-- ----------------------------
DROP VIEW IF EXISTS `staff_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `staff_list` AS SELECT s.staff_id AS ID, CONCAT(s.first_name, _utf8mb4' ', s.last_name) AS name, a.address AS address, a.postal_code AS `zip code`, a.phone AS phone,
	city.city AS city, country.country AS country, s.store_id AS SID
FROM staff AS s JOIN address AS a ON s.address_id = a.address_id JOIN city ON a.city_id = city.city_id
	JOIN country ON city.country_id = country.country_id; ;

-- ----------------------------
-- Procedure structure for film_in_stock
-- ----------------------------
DROP PROCEDURE IF EXISTS `film_in_stock`;
delimiter ;;
CREATE PROCEDURE `film_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
  READS SQL DATA 
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id);

     SELECT COUNT(*)
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND inventory_in_stock(inventory_id)
     INTO p_film_count;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for film_not_in_stock
-- ----------------------------
DROP PROCEDURE IF EXISTS `film_not_in_stock`;
delimiter ;;
CREATE PROCEDURE `film_not_in_stock`(IN p_film_id INT, IN p_store_id INT, OUT p_film_count INT)
  READS SQL DATA 
BEGIN
     SELECT inventory_id
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id);

     SELECT COUNT(*)
     FROM inventory
     WHERE film_id = p_film_id
     AND store_id = p_store_id
     AND NOT inventory_in_stock(inventory_id)
     INTO p_film_count;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for get_customer_balance
-- ----------------------------
DROP FUNCTION IF EXISTS `get_customer_balance`;
delimiter ;;
CREATE FUNCTION `get_customer_balance`(p_customer_id INT, p_effective_date DATETIME)
 RETURNS decimal(5,2)
  READS SQL DATA 
  DETERMINISTIC
BEGIN

       #OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
       #THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
       #   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
       #   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
       #   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
       #   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED

  DECLARE v_rentfees DECIMAL(5,2); #FEES PAID TO RENT THE VIDEOS INITIALLY
  DECLARE v_overfees INTEGER;      #LATE FEES FOR PRIOR RENTALS
  DECLARE v_payments DECIMAL(5,2); #SUM OF PAYMENTS MADE PREVIOUSLY

  SELECT IFNULL(SUM(film.rental_rate),0) INTO v_rentfees
    FROM film, inventory, rental
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;

  SELECT IFNULL(SUM(IF((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) > film.rental_duration,
        ((TO_DAYS(rental.return_date) - TO_DAYS(rental.rental_date)) - film.rental_duration),0)),0) INTO v_overfees
    FROM rental, inventory, film
    WHERE film.film_id = inventory.film_id
      AND inventory.inventory_id = rental.inventory_id
      AND rental.rental_date <= p_effective_date
      AND rental.customer_id = p_customer_id;


  SELECT IFNULL(SUM(payment.amount),0) INTO v_payments
    FROM payment

    WHERE payment.payment_date <= p_effective_date
    AND payment.customer_id = p_customer_id;

  RETURN v_rentfees + v_overfees - v_payments;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for inventory_held_by_customer
-- ----------------------------
DROP FUNCTION IF EXISTS `inventory_held_by_customer`;
delimiter ;;
CREATE FUNCTION `inventory_held_by_customer`(p_inventory_id INT)
 RETURNS int(11)
  READS SQL DATA 
BEGIN
  DECLARE v_customer_id INT;
  DECLARE EXIT HANDLER FOR NOT FOUND RETURN NULL;

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for inventory_in_stock
-- ----------------------------
DROP FUNCTION IF EXISTS `inventory_in_stock`;
delimiter ;;
CREATE FUNCTION `inventory_in_stock`(p_inventory_id INT)
 RETURNS tinyint(1)
  READS SQL DATA 
BEGIN
    DECLARE v_rentals INT;
    DECLARE v_out     INT;

    #AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    #FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

    SELECT COUNT(*) INTO v_rentals
    FROM rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM inventory LEFT JOIN rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for rewards_report
-- ----------------------------
DROP PROCEDURE IF EXISTS `rewards_report`;
delimiter ;;
CREATE PROCEDURE `rewards_report`(IN min_monthly_purchases TINYINT UNSIGNED
    , IN min_dollar_amount_purchased DECIMAL(10,2)
    , OUT count_rewardees INT)
  READS SQL DATA 
  COMMENT 'Provides a customizable report on best customers'
proc: BEGIN

    DECLARE last_month_start DATE;
    DECLARE last_month_end DATE;

    /* Some sanity checks... */
    IF min_monthly_purchases = 0 THEN
        SELECT 'Minimum monthly purchases parameter must be > 0';
        LEAVE proc;
    END IF;
    IF min_dollar_amount_purchased = 0.00 THEN
        SELECT 'Minimum monthly dollar amount purchased parameter must be > $0.00';
        LEAVE proc;
    END IF;

    /* Determine start and end time periods */
    SET last_month_start = DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);
    SET last_month_start = STR_TO_DATE(CONCAT(YEAR(last_month_start),'-',MONTH(last_month_start),'-01'),'%Y-%m-%d');
    SET last_month_end = LAST_DAY(last_month_start);

    /*
        Create a temporary storage area for
        Customer IDs.
    */
    CREATE TEMPORARY TABLE tmpCustomer (customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY);

    /*
        Find all customers meeting the
        monthly purchase requirements
    */
    INSERT INTO tmpCustomer (customer_id)
    SELECT p.customer_id
    FROM payment AS p
    WHERE DATE(p.payment_date) BETWEEN last_month_start AND last_month_end
    GROUP BY customer_id
    HAVING SUM(p.amount) > min_dollar_amount_purchased
    AND COUNT(customer_id) > min_monthly_purchases;

    /* Populate OUT parameter with count of found customers */
    SELECT COUNT(*) FROM tmpCustomer INTO count_rewardees;

    /*
        Output ALL customer information of matching rewardees.
        Customize output as needed.
    */
    SELECT c.*
    FROM tmpCustomer AS t
    INNER JOIN customer AS c ON t.customer_id = c.customer_id;

    /* Clean up */
    DROP TABLE tmpCustomer;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table customer
-- ----------------------------
DROP TRIGGER IF EXISTS `customer_create_date`;
delimiter ;;
CREATE TRIGGER `customer_create_date` BEFORE INSERT ON `customer` FOR EACH ROW SET NEW.create_date = NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table film
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_film`;
delimiter ;;
CREATE TRIGGER `ins_film` AFTER INSERT ON `film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table film
-- ----------------------------
DROP TRIGGER IF EXISTS `upd_film`;
delimiter ;;
CREATE TRIGGER `upd_film` AFTER UPDATE ON `film` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table film
-- ----------------------------
DROP TRIGGER IF EXISTS `del_film`;
delimiter ;;
CREATE TRIGGER `del_film` AFTER DELETE ON `film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table payment
-- ----------------------------
DROP TRIGGER IF EXISTS `payment_date`;
delimiter ;;
CREATE TRIGGER `payment_date` BEFORE INSERT ON `payment` FOR EACH ROW SET NEW.payment_date = NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table rental
-- ----------------------------
DROP TRIGGER IF EXISTS `rental_date`;
delimiter ;;
CREATE TRIGGER `rental_date` BEFORE INSERT ON `rental` FOR EACH ROW SET NEW.rental_date = NOW()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
