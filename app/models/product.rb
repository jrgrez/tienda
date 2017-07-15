class Product < ApplicationRecord
  belongs_to :category

  validates :price, presence: true
  validates_numericality_of :discount, greater_than_or_equal_to: 0, less_than_or_equal_to: 100
  #validates_numericality_of :discount
  
  after_destroy :erase_last
  before_save :set_premium 

  scope :premium, -> {where(premium: true)}
  scope :last_n, ->(numero) {Product.order("id DESC").limit(numero)}
  scope :search_category, ->(busqueda){where("category.name = ?", busqueda)}

  def precio_final
  	self.price - self.discount
  end

  def set_premium 
  	self.premium ||= false
  end

  def erase_last
 	self.category.destroy if self.category.products.count == 0
  end

end
