
require 'rails_helper'

RSpec.describe "Events" do
 it "publishes rabbit event" do
  allow(OrderPublisher).to receive(:publish)
  post "/orders", params:{customer_id:1,product_name:"TV",quantity:1,price:10,status:"new"}
  expect(OrderPublisher).to have_received(:publish)
 end
end
