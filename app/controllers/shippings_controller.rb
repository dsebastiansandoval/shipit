class ShippingsController < ApplicationController

  def initialize()
    super
    @all_orders = Order.all
    @shippments = Shipping.all
  end


  def new
      if Order.exists?(order_id: params[:locat])
        order = Order.find_by(order_id: params[:locat])
        @shipping = Shipping.where(order_id: order.id).first_or_create()
        @shipping.update(order_id: order.id)
        @shipping.update(status: "OK")

        if @shipping.save

          redirect_to '/show_ships'
        else
          redirect_to '/'
        end

      else
        redirect_to '/'
      end
    
  end


end