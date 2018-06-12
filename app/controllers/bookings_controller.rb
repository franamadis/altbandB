class BookingsController < ApplicationController

  def index
    @booking = Booking.find(params(:user_id))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = @user

      if @booking.save
      redirect_to bookings_path(@booking.id)
    else
      render "bookings/new"
    end
  end

private

  def booking_params
    params.require(:booking).permit(:period, :total, :status, :guests, :flat_id, :user_id)
  end


end
