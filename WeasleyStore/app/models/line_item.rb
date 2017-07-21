class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart
  #before_destroy { |record| record.product.increment!(:quantity, record.quantity) }
  
  def total_price
    product.galleons * quantity
  end
  
  def convert_to_muggle(galleons)
    return (self.total_price * 7.35)
  end
  
end
