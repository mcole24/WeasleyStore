class Product < ApplicationRecord
    
    paginates_per 9
    mount_uploaders :images, ImagesUploader
    serialize :images, JSON
    
    #monetize :price_cents, :allow_nil => true,
    #:numericality => {
    #:greater_than_or_equal_to => 0,
    #:less_than_or_equal_to => 10000
    #}
  
    def self.search(term)
      if term
        where('product_name LIKE ?', "%#{term}%")
      else
        all
      end
    end
    
    
  def convert_to_muggle(galleons)
    return (galleons * 7.35)
  end    
    
end
