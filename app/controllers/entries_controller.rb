class EntriesController < ApplicationController
  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    # render entries/new view
  end

  def create
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to "/places/#{@place["id"]}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.permit(:title, :description, :occurred_on, :place_id)
  end
end
