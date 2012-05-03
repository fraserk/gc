class EventsController < ApplicationController
  autocomplete :venue, :name, :full => true
  before_filter :authenticate_user!, :except => [:index,:show]
  def index
    
    @events = Event.paginate(:page => params[:page], :per_page => 6).where("expire != ?", true).order("event_date ASC")
    @events_date = @events.group_by {|t| t.event_date}
    
    #Post.paginate()
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
    @MyEvent = Event.paginate(:page => params[:page], :per_page => 6).where(:user_id => current_user.id,  :expire => false).order("event_date ASC")
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

end
