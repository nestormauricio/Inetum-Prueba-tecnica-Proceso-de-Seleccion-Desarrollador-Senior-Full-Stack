class OrderEventConsumer
  require 'bunny'
  def self.listen
    conn = Bunny.new(hostname: 'rabbitmq', automatically_recover: true)
    conn.start
    ch = conn.create_channel
    x = ch.fanout('order_events')
    q = ch.queue('', exclusive: true).bind(x)
    q.subscribe(block: true) do |_di,_meta,payload|
      data = JSON.parse(payload)
      customer = Customer.find(data['customer_id'])
      customer.increment!(:orders_count)
    end
  end
end
