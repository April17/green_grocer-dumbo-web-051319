require "pry"
def consolidate_cart(cart)
  # code here
  cartHash = {}
  for i in 0...cart.length
    cart[i].each do |key, value|
      cartHash[key] = value
      cartHash[key][:count] = 0
    end
  end
  cartHash.each do |key, value|
    for k in 0...cart.length
      cart[k].each do |keyCart, valueCart|
        if key.to_s == keyCart.to_s
          cartHash[key][:count] += 1
        end
      end
    end
  end
  return cartHash
end

def apply_coupons(cart, coupons)
  # code here
  newCart = {}.merge(cart)
  couponHashtemp = {}
  for i in 0...coupons.length
    cart.each do |cartKey, cartValue|
      if coupons[i][:item] == cartKey
        couponHashtemp = {}.merge(cartValue)
        couponHashtemp[:price] = coupons[i][:cost]
        couponHashtemp[:count] = couponHashtemp[:count] / coupons[i][:num]
        newCart[coupons[i][:item]][:count] -= coupons[i][:num]
        newCart["#{coupons[i][:item]} W/COUPON"] = couponHashtemp
      else
        return newCart
      end
    end
  end
  return newCart
end

def apply_clearance(cart)
  # code here
  cart.each do |cartKey, cartValue|
    if cartValue[:clearance] == true
      priceTemp = cartValue[:price]
      priceTemp *= 0.8
      cartValue[:price] = priceTemp.round(1)
    end
  end
  return cart
end

def checkout(cart, coupons)
  # code here
end
