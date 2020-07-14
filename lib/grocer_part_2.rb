require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupon_counter = 0 
  cart_counter = 0 
  update_cart = []
  while coupon_counter < coupons.length do 
    while cart_counter < cart.length do 
      if coupons[coupon_counter][:item] == cart[cart_counter][:item]
        if coupons[coupon_counter][:num] <= cart[cart_counter][:count]
          cart[cart_counter][:count] = cart[cart_counter][:count] - coupons[coupon_counter][:num]
          update_cart << cart[cart_counter]
          grocery_with_coupon = {
            :item => cart[cart_counter][:item] + "W/COUPON",
            :price => coupons[coupon_counter][:cost] / coupons[coupon_counter][:num],
            :clearance => cart[cart_counter][:clearance],
            :count => coupons[coupon_counter][:num] 
          }
          update_cart << grocery_with_coupon 
        end
      end
      cart_counter += 1
    end 
    coupon_counter += 1 
  end 
  cart_counter = 0 
  update_cart_counter = 0 
  while cart_counter < cart.length do 
    found = false 
    while update_cart_counter < update_cart.length do
      if cart[cart_counter][:item] == update_cart[update_cart_counter][:item] 
        found = true  
      end
      update_cart_counter += 1
    end
    if !found
      update_cart << cart[cart_counter]  
    end
    cart_counter += 1
  end
  update_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  counter = 0 
  while counter < cart.length do 
    if cart[counter][:clearance]
      cart[counter][:price] = cart[counter][:price] - (cart[counter][:price] * 0.20)
      cart[counter][:price] = cart[counter][:price].round(2)
    end
    counter += 1
  end
  return cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
