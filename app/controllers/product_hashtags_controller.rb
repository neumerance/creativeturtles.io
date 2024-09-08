class ProductHashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(name: params[:id])
    @products = @hashtag.products

    render template: 'products/index'  
  end
end
