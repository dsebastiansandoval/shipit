class ShippingsController < ApplicationController

  def index


  end

  def new
      if Order.exists?(order_id: params[:locat])
     
     end
     order = Order.find_by(order_id: params[:locat])
     @shipping = Shipping.where(order_id: order.id).first_or_create()
     @shipping.update(order_id: order.id)

     if @shipping.save

       redirect_to '/'
     else
       redirect_to '/'
     end
    
  end

  def create
    
  end

end