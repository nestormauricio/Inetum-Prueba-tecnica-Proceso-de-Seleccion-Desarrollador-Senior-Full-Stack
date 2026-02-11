FactoryBot.define do
 factory :order do
 customer_id {1}
 product_name {'Widget'}
 quantity {5}
 price {9.99}
 status {'new'}
 end
end
