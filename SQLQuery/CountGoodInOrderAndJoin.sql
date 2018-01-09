USE coffee
select order_id,good_id, goods.name , sum(goods.price)
from orderGoods
left join goods on orderGoods.good_id = goods.id
group by order_id, good_id, goods.name , goods.price
