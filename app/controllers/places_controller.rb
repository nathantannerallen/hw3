class PlacesController < ApplicationController
  def index
    @places = Place.all.order(:name)
  end

  def show
    @place = Place.find(params[:id])
    @entries = Entry.where(place_id: @place.id).order(occurred_on: :desc, created_at: :desc)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place.name = params[:name]

    if @place.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
