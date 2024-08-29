class TalentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @talent = current_user
  end

  def show
  end
end
