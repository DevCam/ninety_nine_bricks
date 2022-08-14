# json.array! @shopping_carts, partial: "shopping_carts/shopping_cart", as: :shopping_cart
json.array! @shopping_carts do |cart|
  json.id cart.id
  json.user_id cart.user_id
  json.url shopping_cart_url(cart, format: :json)
end
