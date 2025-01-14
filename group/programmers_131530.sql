SELECT 
    FLOOR(PRICE / 10000) * 10000 PRICE_GROUP, COUNT(*) PRODUCTS
FROM 
    PRODUCT
GROUP BY 
    FLOOR(PRICE / 10000)
ORDER BY 
    PRICE_GROUP

/*Group By 1 활용하기*/
SELECT
    TRUNCATE(price, -4) price_group,
    COUNT(product_id) products
FROM
    product
GROUP BY
    1
ORDER BY
    1;
