# Sephora A/W 2024 Campaign Database

## Overview

This project involves creating and managing a relational database for a retail campaign organised by Sephora for the Autumn/Winter 2024 season. Sephora intends to identify the best-selling products during an influencer event, to help establish the products to feature in their marketing campaign. The database captures data about influencers attending the event, the products available for purchase, and the purchases made by the influencers.

## Objective

Sephora wants to determine the 10 best-selling products from a range of items available at a PR event. Influencers are invited to this event, where they purchase products to try. The data from the event and subsequent purchases will help Sephora decide which products to feature in their upcoming marketing campaigns for the 2024 A/W season.

## Database Design

The database consists of three main tables:

1. **Influencers** - Information about the influencers attending the PR event.
2. **Products** - Data on products available for purchase at the event.
3. **Influencer Purchases** - Captures the purchases made by the influencers.

### Table 1: Influencers

Stores information about influencers attending the event.

| Column                   | Data Type          | Description                                    |
|--------------------------|--------------------|------------------------------------------------|
| influencer_id            | INT                | Unique ID for each influencer (Primary Key)    |
| influencer_first_name    | VARCHAR(100)       | Influencer's first name                        |
| influencer_last_name     | VARCHAR(100)       | Influencer's last name                         |
| social_media_handle      | VARCHAR(100)       | Social media handle (unique)                   |
| social_media_followers   | INT                | Number of followers on social media            |
| influencer_gender        | VARCHAR(50)        | Influencer's gender                             |

### Table 2: Products

Stores details about the products available at the PR event.

| Column                   | Data Type          | Description                                    |
|--------------------------|--------------------|------------------------------------------------|
| product_id               | INT                | Unique ID for each product (Primary Key)       |
| product_category         | VARCHAR(100)       | Product category (e.g., Makeup, Skincare)      |
| product_subcategory      | VARCHAR(100)       | Subcategory of the product (e.g., Complexion)  |
| product_name             | VARCHAR(100)       | Product name                                   |
| price                    | FLOAT              | Product price                                  |
| skin_type                | VARCHAR(100)       | Skin type suitable for the product (Optional)  |
| ratings                  | INT                | Product rating (1 to 5 scale)                  |

### Table 3: Influencer Purchases

Stores data about purchases made by each influencer.

| Column             | Data Type          | Description                                  |
|--------------------|--------------------|----------------------------------------------|
| purchase_id        | INT                | Unique ID for each purchase (Primary Key)    |
| influencer_id      | INT                | ID of the influencer making the purchase     |
| product_id         | INT                | ID of the product being purchased            |
| date_of_purchase   | DATE               | Date the purchase was made                   |

## Sample Queries

1. **Query 1:** Retrieve data of transactions made by each influencer ID in order of the latest date.

```sql
SELECT 
    ip.purchase_id,
    ip.influencer_id,
    ip.date_of_purchase
FROM 
    influencer_purchases ip
ORDER BY 
    ip.purchase_id DESC;
```

2. **Query 2:** Retrieve the average price of products in each product category.
```sql
SELECT
    p.product_category,
    ROUND(AVG(p.price), 2) average_price
FROM 
    products p
WHERE 
    p.product_category IN ("Makeup", "Skincare", "Fragrance", "Body")
GROUP BY
    p.product_category;
```
3. **Query 3:** Retrieve the total amount spent by each influencer on the PR event date.
```sql
SELECT 
    ip.influencer_id,
    SUM(CEIL(p.price)) total_spent
FROM 
    influencer_purchases ip
INNER JOIN 
    products p ON ip.product_id = p.product_id
WHERE 
    ip.date_of_purchase = "2024-09-27"
GROUP BY
    ip.influencer_id;
```

4. **Query 4:** Count influencers with more than 1 million followers who purchased the most expensive product.
```sql
SELECT 
    COUNT(DISTINCT i.influencer_id) influencer_count
FROM
    influencers i
LEFT JOIN 
    influencer_purchases ip ON i.influencer_id = ip.influencer_id
LEFT JOIN
    products p ON ip.product_id = p.product_id
WHERE 
    i.social_media_followers > 1000000
    AND p.price = (SELECT MAX(price) FROM products);
```

5. **Query 5:** Retrieve influencers who purchased products for specific skin conditions.
```sql
SELECT 
    i.influencer_id,
    CONCAT(i.influencer_first_name, " ", i.influencer_last_name) influencer_full_name,
    i.social_media_handle,
    p.skin_type
FROM
    influencers i
INNER JOIN 
    influencer_purchases ip ON i.influencer_id = ip.influencer_id
INNER JOIN
    products p ON ip.product_id = p.product_id
WHERE 
    p.skin_type IS NOT NULL
ORDER BY
    influencer_full_name;
```

## Stored Procedure
- A stored procedure to retrieve the 10 best-selling products from the PR event.
```sql
DELIMITER //

CREATE PROCEDURE best_selling_products()
BEGIN 
    SELECT
        p.product_name,
        COUNT(ip.purchase_id) total_sales,
        ROUND(AVG(p.ratings), 2) average_rating
    FROM
        products p
    INNER JOIN
        influencer_purchases ip ON p.product_id = ip.product_id
    GROUP BY
        p.product_id
    ORDER BY
        total_sales DESC
    LIMIT 10;
END //

DELIMITER ;
CALL best_selling_products();
```

## Conclusion
- This database helps Sephora gather important data for their A/W 2024 marketing campaign. By analysing purchases and influencer behaviors, Sephora can determine which products are the most popular and which will be featured in their upcoming campaign.
  
