class LocationsController < ApplicationController
  def index
  end

  def show
  end

  def new
  @location = Location.new
  end

  def edit
  end

  def create
  @location = Location.new(params[:locations])
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

end
