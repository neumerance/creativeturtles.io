class TalentsController < ApplicationController
  before_action :authenticate_user!, only: %i(edit)

  def show
    @talent = Talent.joins(:products).find_by(handle: params[:handle])
  end

  def edit
    @talent = Talent.find(params[:id])
  end

  def upload
    @talent = Talent.find(params[:id])
    file = params[:file]
    @talent.send(params[:field]).attach(file) if params[:file].present?

    head :ok
  end

  private

  def permitted_params
    params.require(:talents).permit(
      :photo,
      :cover_photo,
      :handle,
      :first_name,
      :last_name,
      :headline,
      :about
    )
  end
end
