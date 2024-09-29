/* Design and implement a database that solves a specific problem as per your chosen theme
Remember to come up with a unique creative problem or scenario and show real-life 
Expected use of your database! */

/* Creative scenario: The retail company Sephora wants to create a marketing campaign for this A/W 2024,
they want to establish which of their best-selling products to use in their marketing campaign,
so they organise an influencer event with a range of their products for them to buy,
and they capture their purchases in a database to figure out the 10 best-selling products */

CREATE DATABASE sephora_aw24_campaign; -- Created a database
USE sephora_aw24_campaign; -- Used the database

/* Table 1 contains data about UK influencers that have been invited to the PR event,
this includes their id, first and last name, social media handle, social media followers and gender */

CREATE TABLE influencers ( -- Created first table, added columns with different data types
    influencer_id INT PRIMARY KEY, 
    influencer_first_name VARCHAR(100),
    influencer_last_name VARCHAR(100),
    social_media_handle VARCHAR(100) NOT NULL, -- Social media handles have to be recorded
    social_media_followers INT,
	influencer_gender VARCHAR(50),
    UNIQUE (social_media_handle) -- Social media handles can't be the same
);

INSERT INTO influencers ( -- Added values into the columns
    influencer_id,
    influencer_first_name,
    influencer_last_name,
    social_media_handle,
    social_media_followers,
    influencer_gender
)
VALUES
	(1, "Alice", "Thomas", "@alxcext", 640000, "Female"),
	(2, "Cinzia", "Baylis-Zullo", "@cinziabayliszullo", 540000, "Female"),
	(3, "Ewoma", "Ukeleghe", "@drewomaukeleghe", 210000, "Female"),
	(4, "Grace", "Beverley", "@gracebeverley", 1000000, "Female"),
	(5, "Jessica", "Hunt", "@jesshunt2", 1700000, "Female"),
	(6, "Molly", "Hague", "@mollymae", 8500000, "Female"),
	(7, "Melissa", "Holdbrook-Akposoe", "@melissaswardrobe", 350000, "Female"),
	(8, "Noorie", "Ana", "@noorieana", 1330000, "Female"),
	(9, "Tennille", "Jenkins", "@thetennillelife", 3150000, "Female"),
	(10, "Uche", "Natori", "@uchjn", 6260000, "Female")
;

/* Table 2 contains data about the products that are available to purchase at the PR event,
this includes the product number, category breakdown, product name, price, skin type (if applicable) and ratings */

CREATE TABLE products ( -- Created second table, added columns with different data types
    product_id INT PRIMARY KEY,
    product_category VARCHAR(100),
    product_subcategory VARCHAR(100),
    product_name VARCHAR(100),
    price FLOAT,
    skin_type VARCHAR(100) NULL, -- NULL values accepted as not all products fit this criteria
    ratings INT,
    UNIQUE (product_name) -- Product names can't be the same
);

INSERT INTO products ( -- Added values into the columns
    product_id,
    product_category,
    product_subcategory,
    product_name,
    price,
    skin_type,
    ratings
)
VALUES 
    (2317, "Makeup", "Complexion", "Estee Lauder Double Wear Foundation", 39.50, "Combination to oily skin", 4),
    (2318, "Makeup", "Complexion", "Huda Beauty Easy Blur Foundation", 32.00, "Dry skin", 3),
    (2319, "Makeup", "Lips", "Summer Fridays Lip Butter Balm", 23.00, NULL, 4),
    (2320, "Makeup", "Lips", "Dior Addict Lip Glow Oil", 32.00, NULL, 2),
    (2321, "Makeup", "Brows", "Refy Brow Sculpt", 18.00, NULL, 4),
    (2322, "Makeup", "Brows", "Glossier Boy Brow Volumizing Eyebrow Gel-Pomade", 22.00, NULL, 2),
    (2323, "Skincare", "Moisturisers", "Elemis Superfood Midnight Facial", 46.00, "Dry skin", 5),
    (2324, "Skincare", "Moisturisers", "Weleda Skin Food", 14.95, "Combination to oily skin", 4),
    (2325, "Skincare", "Cleansers", "CeraVe Foaming Cleanser with Niacinamide", 11.95, "Normal to oily skin", 3),
    (2326, "Skincare", "Cleansers", "Paula's Choice Clear Pore Normalizing Cleanser", 22.00, "Acne prone skin", 5),
    (2327, "Skincare", "Toners", "Caudalie Beauty Elixir", 36.00, NULL, 1),
    (2328, "Skincare", "Toners", "Glow Recipe Cloudberry Bright Essence Toner", 34.00, "Normal to oily skin", 2),
    (2329, "Skincare", "Face Scrubs", "Dermalogica Daily Microfoliant", 48.50, "Dry and sensitive skin", 5),
    (2330, "Fragrance", "For Her", "Maison Margiela Replica Beach Walk", 119.45, NULL, 3),
    (2331, "Fragrance", "For Her", "Killian Paris Love, Don't Be Shy", 225.00, NULL, 5),
    (2332, "Body", "Bodycare", "Aveeno Skin Relief Body Oil Spray", 8.99, "Dry and sensitive skin", 4),
    (2333, "Body", "Bodycare", "Fenty Skin Butta Drop Whipped Oil", 32.00, "Acne prone skin", 4),
    (2334, "Body", "Bodycare", "Tom Ford Solei Blanc Shimmering Body Oil", 45.00, NULL, 2)
;

/* Table 3 contains data about what each influencer purchased at the PR event,
This includes the purchase number, influencer number, product number and the date of purchase */

CREATE TABLE influencer_purchases ( -- Created third table, added columns with different data types
    purchase_id INT,
    influencer_id INT,
    product_id INT,
    date_of_purchase DATE,
    FOREIGN KEY (influencer_id) REFERENCES influencers(influencer_id), -- Linked to the influencers table
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Linked to the products table
);

INSERT INTO influencer_purchases ( -- Added values into the columns
    purchase_id,
    influencer_id,
    product_id,
    date_of_purchase
)
VALUES
-- Transaction 5678: influencer 1 buys 4 products
    (5678, 1, 2317, CURRENT_DATE),
    (5678, 1, 2319, CURRENT_DATE),
    (5678, 1, 2331, CURRENT_DATE),
    (5678, 1, 2329, CURRENT_DATE),
-- Transaction 5679: influencer 2 buys 2 products
    (5679, 2, 2321, CURRENT_DATE),
    (5679, 2, 2333, CURRENT_DATE),
-- Transaction 5680: influencer 3 buys 3 products
    (5680, 3, 2323, CURRENT_DATE),
    (5680, 3, 2326, CURRENT_DATE),
    (5680, 3, 2318, CURRENT_DATE),
-- Transaction 5681: influencer 4 buys 3 products
    (5681, 4, 2333, CURRENT_DATE),
    (5681, 4, 2327, CURRENT_DATE),
    (5681, 4, 2331, CURRENT_DATE),
-- Transaction 5682: influencer 5 buys 3 products
    (5682, 5, 2329, CURRENT_DATE),
    (5682, 5, 2324, CURRENT_DATE),
    (5682, 5, 2323, CURRENT_DATE),
-- Transaction 5683: influencer 6 buys 5 products
    (5683, 6, 2321, CURRENT_DATE),
    (5683, 6, 2333, CURRENT_DATE),
    (5683, 6, 2319, CURRENT_DATE),
    (5683, 6, 2329, CURRENT_DATE),
    (5683, 6, 2331, CURRENT_DATE),
-- Transaction 5684: influencer 7 buys 4 products
    (5684, 7, 2331, CURRENT_DATE),
    (5684, 7, 2317, CURRENT_DATE),
    (5684, 7, 2323, CURRENT_DATE),
    (5684, 7, 2318, CURRENT_DATE),
-- Transaction 5685: influencer 8 buys 4 products
    (5685, 8, 2317, CURRENT_DATE),
    (5685, 8, 2323, CURRENT_DATE),
    (5685, 8, 2329, CURRENT_DATE),
    (5685, 8, 2331, CURRENT_DATE),
-- Transaction 5686: influencer 9 buys 2 products
    (5686, 9, 2322, CURRENT_DATE),
    (5686, 9, 2317, CURRENT_DATE),
-- Transaction 5687: influencer 10 buys 5 products
    (5687, 10, 2321, CURRENT_DATE),
    (5687, 10, 2331, CURRENT_DATE),
    (5687, 10, 2327, CURRENT_DATE),
    (5687, 10, 2323, CURRENT_DATE),
    (5687, 10, 2333, CURRENT_DATE)
;

-- 3 queries to insert data:

/* Inserted a new fragrance to the products table because it was sent last minute by the brand 
before the PR event */

INSERT INTO 
	products (product_id, product_category, product_subcategory, product_name, price, skin_type, ratings)
VALUES 
	(2335, "Fragrance", "For Her", "Prada Paradoxe Eau de Parfum", 135.00, NULL, 5)
;

/* Inserted a new influencer to the influencers table because she attended the PR event as a +1 */

INSERT INTO 
	influencers (influencer_id, influencer_first_name, influencer_last_name, social_media_handle, social_media_followers, influencer_gender)
VALUES
	(11, "Eva", "Apio", "@evssofficial", 811000, "Female")
;

/* Inserted new transactions to the influencer purchases table because the +1 influencer bought 
items after the PR event */

INSERT INTO
	influencer_purchases (purchase_id, influencer_id, product_id, date_of_purchase)
VALUES
	(5688, 11, 2317, CURRENT_DATE),
	(5688, 11, 2333, CURRENT_DATE),
	(5688, 11, 2329, CURRENT_DATE),
	(5688, 11, 2325, CURRENT_DATE)
;

-- 5 queries to retrieve data:

/* Query 1 retrieves the data of transactions made by each influencer ID in order of the latest date,
this includes any transactions made after the PR event */

SELECT 
    ip.purchase_id,
    ip.influencer_id,
    ip.date_of_purchase
FROM 
	influencer_purchases ip
ORDER BY 
	ip.purchase_id DESC -- Latest date to show first
;

/* Query 2 retrieves the average price of the products available to buy at the PR event for each 
product category */

SELECT
	p.product_category,
	ROUND(AVG(p.price), 2) average_price -- Rounded the average price to two decimal places
FROM 
	products p
WHERE 
	p.product_category IN ("Makeup", "Skincare", "Fragrance", "Body") -- Specifies multiple categories
GROUP BY
	p.product_category
;
    
/* Query 3 retrieves the total spent by each influencer ID on the day of the PR event */   
 
SELECT 
	ip.influencer_id,
        SUM(CEIL(p.price)) total_spent -- Gets the total sum and rounds up the price of products purchased
FROM 
	influencer_purchases ip
INNER JOIN 
	products p ON ip.product_id = p.product_id -- Joins the p table to the ip table
WHERE 
	ip.date_of_purchase = "2024-09-27" -- Excludes any transactions made after the PR event
GROUP BY
	ip.influencer_id
; 

/* Query 4 simultaneously counts the influencer IDs who have more than 1 million followers and purchased
the most expensive products */

SELECT 
	COUNT(DISTINCT i.influencer_id) influencer_count -- If multiple purchases made by influencer ID, only counts once
FROM
	influencers i
LEFT JOIN 
	influencer_purchases ip ON i.influencer_id = ip.influencer_id -- Joins the ip table to the i table
LEFT JOIN
	products p ON ip.product_id = p.product_id -- Joins the p table to the ip table
WHERE 
	i.social_media_followers > 1000000 -- Filters the results set to influencers who have 1m + followers
        AND p.price = (SELECT MAX(price) FROM products) -- Subquery gets the highest priced product and filters the results set
;

/* Query 5 retrieves the data of influencers who purchased products for specific skin conditions
sorted alphabetically by full name */

SELECT 
	i.influencer_id,
	CONCAT(i.influencer_first_name, " ", i.influencer_last_name) influencer_full_name, -- Gets first name and last name as a single string
	i.social_media_handle,
        p.skin_type
FROM
	influencers i
INNER JOIN 
	influencer_purchases ip ON i.influencer_id = ip.influencer_id -- Joins the ip table to the i table
INNER JOIN
	products p ON ip.product_id = p.product_id -- Joins the p table to the ip table
WHERE 
	p.skin_type IS NOT NULL -- Filters results set to products that cater to specific skin types
ORDER BY
	influencer_full_name -- Orders the results set in alphabetical order
;

-- 1 query to delete data:

/* Deleted the transaction where the purchase ID is 5679 and product ID 2333 because the 
influencer requested a refund */

DELETE FROM 
	influencer_purchases ip
WHERE 
	ip.purchase_id = 5679 AND ip.product_id = 2333 -- Filters the query to only delete this purchase
; 

-- 1 stored procedure:

/* A stored procedure that calls the 10 best-selling products of the PR event to be used in 
the marketing campaign */

DELIMITER //

CREATE PROCEDURE best_selling_products() -- Created stored procedure

BEGIN 
	SELECT
		p.product_name,
		COUNT(ip.purchase_id) total_sales, -- Counts the total sales of a product
		ROUND(AVG(p.ratings), 2) average_rating -- Rounds the average rating to two decimal points
	FROM
		products p
	INNER JOIN
		influencer_purchases ip ON p.product_id = ip.product_id -- Joins the ip table to the p table 
	GROUP BY
		p.product_id
	ORDER BY
		total_sales DESC -- Orders by the product with the highest total sales
	LIMIT 10; -- Limit results set to 10 best-selling products
END //

DELIMITER ;
	CALL best_selling_products() -- Calls the stored procedure
;


    

