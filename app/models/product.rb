class Product < ApplicationRecord
  belongs_to :category
  validates :price, presence: true

  before_save :set_premium 


  def set_premium 
  	self.premium ||= false
  end

end
