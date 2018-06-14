class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @flats = Flat.search_by_name_and_address
    else
      @flats = Flat.where.not(latitude: nil, longitude: nil)

      @markers = @flats.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end
  end
    # @flats = Flat.all
end
