class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings/1/edit
  def edit
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    @rating = Rating.find(params[:id])
    if @rating.update_attributes(number: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:id, :number, :user_id, :food_truck_id)
    end
end
