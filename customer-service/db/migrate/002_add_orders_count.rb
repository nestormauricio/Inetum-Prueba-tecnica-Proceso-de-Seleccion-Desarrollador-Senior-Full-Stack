
class AddOrdersCount < ActiveRecord::Migration[7.0]
 def change
  add_column :customers,:orders_count,:integer,default:0
 end
end
