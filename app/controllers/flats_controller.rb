class FlatsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(review_params)
    # we need `cocktail_id/ingredient_id` to asssociate review with corresponding restaurant
    @flat.user = @user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end
  def show
    @flat = Flat.find(params[:id])
  end

  def destroy
     @flat = Flat.find(params[:id])
     user = @flat.user
     @flat.destroy
     redirect_to root_path
  end

  private

  def review_params
    params.require(:flat).permit(:name, :address, :description, :price, :max_guests, :photo)
  end

  def set_user
   @user = current_user
  end


end
