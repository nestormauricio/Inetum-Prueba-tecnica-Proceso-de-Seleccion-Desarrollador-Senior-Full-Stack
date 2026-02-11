
Thread.new do
 conn=Bunny.new
 conn.start
 ch=conn.create_channel
 q=ch.queue("orders.created")
 q.subscribe(block:true) do |_d,_p,body|
  data=JSON.parse(body)
  c=Customer.find(data["customer_id"])
  c.increment!(:orders_count)
 end
end
