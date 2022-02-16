class OrdersController < ApplicationController

  def initialize()
    super
    @all_orders = Order.all
    @shippments = Shipping.all
  end

  def get_request(uri) #Parse JSON to text array

    request = Net::HTTP::Get.new(uri)
    request.content_type = "application/json"
    request["X-Shopify-Access-Token"] = "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"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
      return JSON.parse(response.body)
  end


  def index
    @all_orders = Order.all
    @shippments = Shipping.all
    uri_count = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders/count.json?status=any")
    uri_orders = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders.json?status=any")
    uri_products = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/products.json")

    cont = get_request(uri_count)["count"].to_i
    orders = get_request(uri_orders)
    @fullfilments ,@ord_ids , @payment, @sku, @orders, @quantity, @properties, @address = [] , [], [], [], [], [], []
    for c in 0...cont
      @orders.push(orders["orders"][c])
      uri_ord = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders/#{orders["orders"][c]["id"]}/fulfillment_orders.json")
      # @fullfilments << get_request(uri_ord)

    end


  end

  def new
    
    @order = Order.where(order_id: params[:locat]).first_or_create()
    @order.update(order_id: params[:locat])

    if @order.save

      redirect_to '/'
    else
      redirect_to '/'
    end
    
  end

  def show



  end

end