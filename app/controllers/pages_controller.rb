class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @flats = Flat.where.not(latitude: nil, longitude: nil).search_by_name_and_address(params[:query])
  
      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
        }

      end
    else
      @flats = Flat.where.not(latitude: nil, longitude: nil)

      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude#,
        } 
      end
    end
  end
    # @flats = Flat.all
end
