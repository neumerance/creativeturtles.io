class TalentsController < ApplicationController
  before_action :authenticate_user!, only: %i(edit)

  def show
    @talent = Talent.joins(:products).find_by(handle: params[:handle])
  end

  def edit
    @talent = Talent.find(params[:id])
  end
end
