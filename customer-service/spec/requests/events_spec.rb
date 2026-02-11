
require 'rails_helper'

RSpec.describe "Consumer" do
 it "increments orders_count" do
  c=Customer.create!(name:"A",address:"B")
  c.increment!(:orders_count)
  expect(c.reload.orders_count).to eq 1
 end
end
