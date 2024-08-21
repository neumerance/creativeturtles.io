class LandingPagesController < ApplicationController
  def homepage
    @products = Product.joins(:talent).all
  end
end
