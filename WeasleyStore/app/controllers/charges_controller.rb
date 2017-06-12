class ChargesController < ApplicationController
    
    
    
    
    def get_sum
       items_in_cart = Items.all
       sum = 0
       items_in_cart.each { |i| sum += i }
       return sum
    end
    
    
    
end
