class CustomerClient
  include HTTParty
  base_uri 'http://localhost:3001'
  def self.find(customer_id)
    get("/customers/#{customer_id}", timeout: 5)
  rescue StandardError => e
    OpenStruct.new(success?: false, error: e.message)
  end
end
