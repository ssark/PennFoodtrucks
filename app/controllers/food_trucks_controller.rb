class FoodTrucksController < ApplicationController
  before_action :set_food_truck, only: [:show, :edit, :update, :destroy]

  # GET /food_trucks
  # GET /food_trucks.json
  def index
    @food_trucks = FoodTruck.all
  end

  # GET /food_trucks/1
  # GET /food_trucks/1.json
  def show
    @rating = @food_truck.ratings.find_by(user_id: current_user.id) if logged_in?
    @status = if @food_truck.open?
                'open'
              else
                @status = 'closed'
              end
  end

  def whats_good
     @ft_to_rate = {}
    FoodTruck.all.each do |ft|
      nonzero = []
      sum = 0
      avg = 0
      rates = ft.ratings
      rates.each do |r|
        nonzero << r if r.number != 0
      end
      nonzero.each do |rate|
        sum += rate.number
      end
      if nonzero.length > 0
        avg = sum / nonzero.length
        @ft_to_rate[ft] = avg
      end
    end
    @ft_to_rate = @ft_to_rate.sort_by {|_key, value| value}.reverse.to_h
    render 'whats_good'
  end

  def whats_open
    @food_trucks = []
    FoodTruck.all.each do |ft|
      @food_trucks << ft if ft.open?
    end
    render 'whats_open'
  end

  def random_food_truck
    food_trucks = FoodTruck.all
    x = rand(food_trucks.length - 1)
    @food_truck = food_trucks[x]
    @rating = @food_truck.ratings.find_by(user_id: current_user.id) if logged_in?
    render 'random_food_truck'
  end

  def sort_by_cuisine
    render 'sort_by_cuisine'
  end

  def show_cuisine
    @cuisine = params[:cuisine]
    @food_trucks = []
    FoodTruck.all.each do |ft|
      @food_trucks << ft if ft.cuisine.eql?(@cuisine)
    end
    render 'show_cuisine'
  end

  private

  def set_food_truck
    @food_truck = FoodTruck.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def food_truck_params
    params.require(:food_truck).permit(:cuisine, :open, :close)
  end
end
