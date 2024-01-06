-- CREATE OR REPLACE VIEW  items1view AS
-- SELECT items.* , categories.* FROM items 
-- INNER JOIN  categories on  items.items_cat = categories.categories_id



-- CREATE OR REPLACE VIEW myfavorite AS
-- SELECT favorite.* , items.* , users.users_id FROM favorite 
-- INNER JOIN users ON users.users_id  = favorite.favorite_usersid
-- INNER JOIN items ON items.items_id  = favorite.favorite_itemsid



 

 
-- CREATE OR REPLACE VIEW cartview AS
--  SELECT SUM(items.items_price) as totalprice , COUNT(cart_itemsid) as itemsquantity , cart.*, items.* FROM cart
--  INNER JOIN items ON items.items_id = cart.cart_itemsid
--  GROUP BY cart.cart_itemsid, cart.cart_usersid

