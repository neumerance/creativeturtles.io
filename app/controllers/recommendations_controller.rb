class RecommendationsController < ApplicationController
  layout false

  def index
    @recommendations = Recommendation.
      where(commendable_type: params[:commendable_type], commendable_id: params[:commendable_id]).
      page(params[:page]).per(5)
  end
end
