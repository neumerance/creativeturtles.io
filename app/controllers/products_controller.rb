class ProductsController < ApplicationController
  layout "frontend"

  def index
    @products = Product.joins(:talent).all
  end

  def show
    @product = Product.joins(:talent).find_by(slug: params[:slug])
  end
end
