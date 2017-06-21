class Product < ApplicationRecord
    
    paginates_per 9
    mount_uploaders :images, ImagesUploader
    serialize :images, JSON
    
    #monetize :price_cents, :allow_nil => true,
    #:numericality => {
    #:greater_than_or_equal_to => 0,
    #:less_than_or_equal_to => 10000
    #}
  
end
