class RatingsController < ApplicationController

  def index

  end

  def create

  end

  private

  def rating_params
    params.require(:rating).permit(
      :culture_score,
  		:environment_score,
  		:cleanliness_score,
  		:location_score,
  		:learning_score,
      :management_score,
      review_attributes: [
        :id,
        :body
      ],
  	)
  end
  
  # def update
  #   @rating = Rating.find(params[:id])
  #   @company = @rating.company
  #   if @rating.update_attributes("#{params[:type]}_score": params[:score], "new_#{params[:type]}_score": false, empty: false)
  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  # end
end
