class TalentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @talent = Talent.joins(:products).find_by(handle: params[:handle])
  end
end
