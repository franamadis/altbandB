class BookingsController < ApplicationController

  def index
    #display all bookings of each user
    # raise
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user

      if @booking.save
      redirect_to booking_path(@booking)
    else
      render "bookings/new"
    end
  end

private

  def booking_params
    params.require(:booking).permit(:period, :total, :status, :guests, :flat_id, :user_id)
  end


end
