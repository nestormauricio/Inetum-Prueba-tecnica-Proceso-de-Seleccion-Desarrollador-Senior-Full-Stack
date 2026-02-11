require 'rails_helper'
RSpec.describe "Orders API", type: :request do
  it "creates an order" do
    post '/orders', params: { order: {customer_id:1, product_name:'Widget', quantity:1, price:10, status:'new'} }
    expect(response).to have_http_status(:created)
  end
end
