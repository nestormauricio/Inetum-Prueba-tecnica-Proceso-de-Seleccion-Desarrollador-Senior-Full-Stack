
class OrdersController < ApplicationController
 def index
  page=(params[:page]||1).to_i
  per=20
  orders = Order.where(customer_id: params[:customer_id])
                .limit(per)
                .offset((page-1)*per)
  render json: orders
 end

 def create
  customer = CustomerClient.fetch(params[:customer_id])
  return render json:{error:"Customer not found"},status:404 unless customer

  order = Order.create!(order_params)
  OrderPublisher.publish(order)
  render json: order,status:201
 end

 private

 def order_params
  params.permit(:customer_id,:product_name,:quantity,:price,:status)
 end
end
