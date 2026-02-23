class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = Entry.new
    @entry.title = params[:title]
    @entry.description = params[:description]
    @entry.occurred_on = params[:occurred_on]
    @entry.place_id = params[:place_id]

    if @entry.save
      redirect_to place_path(@place)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
