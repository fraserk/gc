class VenuesController < ApplicationController
  
  def index
    @venues = Venue.all()
  end
    

  def show
  end

  def new
    @venue = Venue.new()
  end

  def create
    @venue = Venue.new(params[:venue])
    if @venue.save
      redirect_to @venue
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
