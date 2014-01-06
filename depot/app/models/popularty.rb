class Popularty < ActiveRecord::Base
  # attr_accessible :title, :body
  # 
  has_many :popularty_line_items, dependent: :destroy
   accepts_nested_attributes_for :popularty_line_items
   
   def add_product(product_id)
     current_item = popularty_line_items.where(:product_id => product_id).first
     if current_item
       current_item.quantity += 1
     else
       current_item = popularty_line_items.build(:product_id => product_id)
     end
     current_item
   end
end