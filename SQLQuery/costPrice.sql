SELECT goods.id
, goods.name
, goods.price
, ISNULL(SUM(goodIngredients.count * ingredients.cost), 0) as costPrice
, goods.price - ISNULL(SUM(goodIngredients.count * ingredients.cost), 0) as profit
FROM goodIngredients
LEFT JOIN ingredients ON goodIngredients.ingredient_id = ingredients.id
RIGHT JOIN goods ON goodIngredients.good_id = goods.id
GROUP BY goods.id, goods.name, goodIngredients.good_id,goods.price
