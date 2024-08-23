class ProductsController < ApplicationController
  def index
    @products = Product.joins(:talent).all
  end

  def show
    @product = Product.joins(:talent).find(params[:id])
  end
end
