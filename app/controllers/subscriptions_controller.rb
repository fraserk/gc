class SubscriptionsController < ApplicationController
  def new
  	@event = Event.find(params[:format])
  	@subscription = Subscription.new()
  	
  end

  def show
  end

def create
  @subscription = Subscription.new(params[:subscription])
  if @subscription.save_with_payment
    redirect_to @subscription, :notice => "Thank you for subscribing!"
  else
    render :new
  end
end
end
