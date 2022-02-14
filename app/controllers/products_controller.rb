# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    
    # @products = RestClient.get("https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@prueba-tecnica.myshopify.com/admin/api/2022-01/products.json")
    # @products = RestClient.get("https://prueba-tecnica.myshopify.com/admin/oauth/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")
    # api_key = ''
    # secretKey = ''
    # code = ''
    # @products = RestClient.post("https://shipit-developer-test.myshopify.com/admin/oauth/access_token", "client_id=" + api_key)
    @products = RestClient.get("https://shipit-developer-test.myshopify.com/admin/api/2022-01/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")

    render(json: { products: @products })
  end
end
