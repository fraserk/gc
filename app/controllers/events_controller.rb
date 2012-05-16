class EventsController < ApplicationController
 
  before_filter :authenticate_user!, :except => [:index,:show,:contact]
  before_filter :check_event_owner, :only => :edit
  def index
    
    @events = Event.where("expire != ?", true).order("event_date ASC").page(params[:page]).per(25)
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
      if @event.save
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
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event)
    else
      render :action => "edit"
    end
    
  end
 
  
  def myaccount
    @MyEvent = Event.where(:user_id => current_user.id,  :expire => false).order("event_date ASC").page(params[:page]).per(25)
    if @MyEvent.nil?
      flash[:notice] = "You dont have any project"
    end
  end
  
  
  def expire
    @event = Event.where("event_date < ?", Date.today)
     @event.each do |r|
    if r.recurr?
      r.update_attributes(:event_date => Time.now + 6.days)
    end
   if r.recurr = 'f'   
     r.update_attributes(:expire => "true")
   end   
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
