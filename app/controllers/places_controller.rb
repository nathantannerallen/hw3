class PlacesController < ApplicationController
  def index
    @places = Place.all
    # render places/index view
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
    # render places/show view
  end

  def new
    @place = Place.new
    # render places/new view
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to "/places"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.permit(:name)
  end
end
