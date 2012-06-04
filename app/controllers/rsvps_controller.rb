class RsvpsController < ApplicationController
before_filter :authenticate_user!, :except => [:index,:show,:contact,:profile]

  def create
  	@event = Event.find(params[:event_id])
  	@rsvp = @event.rsvps.create(params[:rsvp])
  	redirect_to @event, :notice => "Submission Saved"
  end

  def edit
  end

  def show
  end

end
