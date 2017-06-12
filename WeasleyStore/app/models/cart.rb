class Cart < ApplicationRecord
  belongs_to :user
  serialize :items, Array
end
