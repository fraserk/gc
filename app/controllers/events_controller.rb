class EventsController < ApplicationController
 
  before_filter :authenticate_user!, :except => [:index,:show,:contact,:profile,:destroy_multiple]
  before_filter :check_event_owner, :only => :edit
  def index
    
    @events = Event.where("expire != ?", true).order("event_date ASC").page(params[:page]).per(30)
    #@subscription = Subscription.where()
    @events_date = @events.group_by {|t| t.event_date}
    #Post.paginate()
    @page_description = 'New York & Brooklyn Nightlife party guide. Providing night club listing and party listings. Get on the vip guestlist to the hottest night clubs.'
    @page_keywords    = 'New York City, Manhattan, Night Clubs, Dance Clubs, night life, bars, music, dancing, disco, lounges, under 21, Pary Promoter, Promotion, Night Clubs in Ny, NY nightclub, nite club, vip'
  
  end

  def new
    @event = Event.new()
    @event.location = Location.new
    #1.times  {@event.locations.build}
  end
    
  def create
    @event = Event.new(params[:event])
    @subscription = Subscription.find_by_id(@event.id)
      if @event.save
      #         if @event.featured && !@subscription
      #    redirect_to new_subscription_path(@event) and return  
      #   # else         
      #   #  redirect_to event_path(@event) and return 
      # end
        redirect_to event_path(@event)
      else
        
        render :action => "new"
      end
      
  end

 
  def show
    @event = Event.find(params[:id])
    @page_description = 'New York & Brooklyn Nightlife party guide. Providing night club listing and party listings. Get on the vip guestlist to the hottest night clubs.'
    @page_keywords    = 'New York City, Manhattan, Night Clubs, Dance Clubs, night life, bars, music, dancing, disco, lounges, under 21, Pary Promoter, Promotion, Night Clubs in Ny, NY nightclub, nite club, vip'
  end

  def edit
    @event = Event.find(params[:id])
    if @event.user_id != current_user.id
      redirect_to ''
    end
  end

  def update
    @event = Event.find(params[:id])
    @subscription = Subscription.find_by_id(@event.id)
    if @event.update_attributes(params[:event])
      # if @event.featured && !@subscription
      #    redirect_to new_subscription_path(@event) and return  
      #   # else         
      #   #  redirect_to event_path(@event) and return 
      # end
      redirect_to event_path(@event)
    else
      render :action => "edit"
    end
    
  end
 
  
  def myaccount
    #@MyEvent = Event.where(:user_id => current_user.id,  :expire => false).order("event_date ASC").page(params[:page]).per(25)
    #@MyoldEvent = Event.where(:user_id => current_user.id,  :expire => false).order("event_date ASC").page(params[:page]).per(25)
     
    #if @MyEvent.nil?
    #  flash[:notice] = "You dont have any project"
    #end
  end
  
  def active_event
        @MyEvent = Event.where(:user_id => current_user.id,  :expire => false).order("event_date ASC").page(params[:page]).per(25)
        render :partial => 'active_event'
         if @MyEvent.nil?
      flash[:notice] = "You dont have any project"
    end
  end
  
    def past_event
        @MyEvent = Event.where(:user_id => current_user.id,  :expire => true).order("event_date ASC").page(params[:page]).per(25)
        render :partial => 'past_event'
         if @MyEvent.nil?
      flash[:notice] = "--"
    end
  end


def profile
   @page_description = 'New York & Brooklyn Nightlife party guide. Providing night club listing and party listings. Get on the vip guestlist to the hottest night clubs.'
  @page_keywords    = 'New York City, Manhattan, Night Clubs, Dance Clubs, night life, bars, music, dancing, disco, lounges, under 21, Pary Promoter, Promotion, Night Clubs in Ny, NY nightclub, nite club, vip'
   
 @user = User.find_by_username(params[:id])
 @myprofile = Event.where(:user_id => @user,  :expire => false).order("event_date DESC").page(params[:page]).per(25)
        
 #@profile = Event.find("user_id = ?",params[:id])  
end

  def destroy_multiple

  Event.destroy(params[:events])

  respond_to do |format|
    format.html { redirect_to myaccount_path,:notice => 'Event deleted...' }
    format.json { head :no_content }
  end

end

  def destroy
  end
  
   private 
  def check_event_owner
  @event = Event.find(params[:id])
  
    if @event.user_id != current_user.id
      flash[:notice] = "This is not your event...."
      redirect_to :myaccount
    end
    end

end
