class Product < ApplicationRecord
    
    mount_uploaders :images, ImagesUploader
    serialize :images, JSON
    
    monetize :price_cents, :allow_nil => true,
    :numericality => {
    :greater_than_or_equal_to => 0,
    :less_than_or_equal_to => 10000
  }
  
end
