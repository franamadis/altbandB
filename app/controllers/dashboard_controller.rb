class DashboardController < ApplicationController
  # skip_after_action :verify_authorized

  # def my_bookings
  #   @bookings = policy_scope(Booking).where(user: current_user)
  # end

  # def my_flats
  #   # policy_scope calls solve method that retrieves all flats
  #   @flats = policy_scope(Flat).where(user: current_user)
  # end

  def booking_requests
    @reservations = current_user.reservations
  end
end
