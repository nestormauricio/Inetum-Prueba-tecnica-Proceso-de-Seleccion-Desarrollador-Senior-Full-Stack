require 'rails_helper'
RSpec.describe "Customers API", type: :request do
  it "returns a customer" do
    get '/customers/1'
    expect(response).to have_http_status(:success)
  end
end
