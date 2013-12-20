class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_reader :items

  def initialize
  	@items = []
  end

  def add_product(product)
  	current_item = @items.find {|item| item.product == product}
  	if current_item
  		current_item.increment_quantity
  	else
  		@items << CartItem.new(product)
  end
end
