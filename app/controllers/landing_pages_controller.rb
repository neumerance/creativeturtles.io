class LandingPagesController < ApplicationController
  before_action :set_resource, only: :index

  def index
    if @resource.is_a?(Product)
      respond_with_product_page
    elsif @resource.is_a?(Talent)
      response_with_talent_page
    elsif @resource.class.to_s == "Product::ActiveRecord_Relation"
      respond_with_product_index_page
    else
      respond_with_404
    end
  end

  private

  def respond_with_product_page
    @product = @resource
    render template: "products/show"
  end

  def response_with_talent_page
      @talent = @resource
     render template: "talents/show"
  end

  def respond_with_product_index_page
    @products = @resource
    render template: "products/index"
  end

  def respond_with_404
    raise ActionController::RoutingError.new('Page Not Found')
  end

  def set_resource
    @resource = Product.find_by(slug: params[:slug]) || 
                Talent.find_by(handle: params[:slug]) || 
                Product.joins(:hashtags).where("hashtags.name = ?", params[:slug])
  end
end
