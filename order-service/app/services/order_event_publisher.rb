class OrderEventPublisher
  require 'bunny'
  def self.publish(order)
    conn = Bunny.new(hostname: 'rabbitmq', automatically_recover: true)
    conn.start
    ch = conn.create_channel
    x = ch.fanout('order_events')
    x.publish({event:'order.created', order_id:order.id, customer_id:order.customer_id}.to_json)
    conn.close
  end
end
