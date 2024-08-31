class TalentsController < ApplicationController
  def show
    @talent = Talent.joins(:products).find_by(handle: params[:handle])
  end
end
