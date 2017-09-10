class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  
  def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes(number: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  private
 
  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:id, :number, :user_id, :food_truck_id)
  end
end
