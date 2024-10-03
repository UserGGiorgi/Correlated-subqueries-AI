SELECT pc.id, pc.name
FROM product_category pc
WHERE NOT EXISTS (
    SELECT 1
    FROM product_title pt
    LEFT JOIN product p ON pt.id = p.product_title_id
    LEFT JOIN order_details od ON p.id = od.product_id
    WHERE pt.product_category_id = pc.id
    AND od.id IS NULL
)
ORDER BY pc.id ASC;
