class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.valid_password(user_params)
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
        session[:user_id] = @user.id
        FoodTruck.all.each do |f|
          Rating.create(number: 0, user_id: @user.id, food_truck_id: f.id)
        end
      else
        render :new
      end
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
