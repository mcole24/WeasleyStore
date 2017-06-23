class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product
  serialize :items, Array
end
