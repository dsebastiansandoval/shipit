class OrdersController < ApplicationController

  def get_request(uri)

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
    uri_count = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders/count.json?status=any")
    uri_orders = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders.json?status=any")
    uri_products = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/products.json")

    cont = get_request(uri_count)["count"].to_i
    orders = get_request(uri_orders)
    products = get_request(uri_products)
    @ord_ids , @payment, @sku, @orders, @quantity, @properties, @address = [] , [], [], [], [], [], []
    for c in 0...cont
      @ord_ids.push(orders["orders"][c]["id"])
      @payment.push(orders["orders"][c]["financial_status"])
      if orders["orders"][c]["fulfillments"][0] != nil
        @sku.push(orders["orders"][c]["fulfillments"][0]["line_items"][0]["sku"])
        @quantity.push(orders["orders"][c]["fulfillments"][0]["line_items"][0]["quantity"])
        @properties.push(orders["orders"][c]["fulfillments"][0]["line_items"][0]["properties"])
        @address.push(orders["orders"][c]["fulfillments"][0]["origin_address"])
      else
        @sku.push(nil)
        @quantity.push(nil)
        @properties.push(nil)
        @address.push(nil)
      end
      uri_ord = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders/#{orders["orders"][c]["id"]}.json")
      #@orders.push(get_request(uri_ord)["quantity"])

    end
    @orders = orders

  end

  def new
    
  end

  def create
    
  end

end