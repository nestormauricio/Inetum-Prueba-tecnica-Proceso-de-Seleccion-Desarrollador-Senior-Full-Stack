
class OrderPublisher
 def self.publish(order)
  conn=Bunny.new
  conn.start
  ch=conn.create_channel
  ch.queue("orders.created").publish({order_id:order.id,customer_id:order.customer_id}.to_json)
  conn.close
 end
end
