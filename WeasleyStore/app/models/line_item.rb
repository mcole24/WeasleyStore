class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.galleons * quantity
  end
  
  def convert_to_muggle(galleons)
    return (self.total_price * 7.35)
  end
  
end
