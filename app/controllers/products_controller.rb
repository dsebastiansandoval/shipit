# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    
    # @products = RestClient.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@prueba-tecnica.myshopify.com/admin/api/2022-01/products.json")
    # @products = RestClient.get("https://prueba-tecnica.myshopify.com/admin/oauth/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")
    # api_key = ''
    # secretKey = ''
    # code = ''
    # @products = RestClient.post("https://shipit-developer-test.myshopify.com/admin/oauth/access_token", "client_id=" + api_key)

    require 'net/http'
    require 'uri'

    uri = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders.json?status=any")
    request = Net::HTTP::Get.new(uri)
    request.content_type = "application/json"
    request["X-Shopify-Access-Token"] = "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"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    uri = URI.parse("https://shipit-developer-test.myshopify.com/admin/api/2022-01/orders/4145054023834/fulfillment_orders.json")
    request = Net::HTTP::Get.new(uri)
    request["X-Shopify-Access-Token"] = "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"

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    # response.body

    r = JSON.parse(response.body)

    render :json => r["fulfillment_orders"][0]["line_items"][0]
    # response = {1 => 'Hola'}

    # render(json: { orders: response.body })


    # response.code
    # response.body
    # @products = RestClient.get("https://shipit-developer-test.myshopify.com/admin/api/2022-01/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")

    # render(json: { products: @products })
  end
end
