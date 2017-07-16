class RatingsController < ApplicationController
  def update
    @rating = Rating.find(params[:id])
    @company = @rating.company
    if @rating.update_attributes("#{params[:type]}_score": params[:score], "new_#{params[:type]}_score": false)
      respond_to do |format|
        format.js
      end
    end
  end
end
