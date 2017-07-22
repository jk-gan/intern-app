class RatingsController < ApplicationController

  def index

  end

  def new
    @company = Company.find(params[:company_id])
    @rating = @company.ratings.new
    @rating.build_review
  end

  def create
    @company = Company.find(params[:company_id])
    @rating = @company.ratings.new(rating_params)
    @rating.user = current_user
    if @rating.save
      redirect_to @company
    else
      Rails.logger.info "Error #{@rating.errors.full_messages}"
      redirect_to @company
    end
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
