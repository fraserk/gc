desc "This task will ball by the heroku scheduler to update expire exents"
task :update_event => :environment do
      @event = Event.where("event_date < ?", Date.today)
     @event.each do |r|
    if r.recurr = 't'
      r.update_attributes(:event_date => Time.now + 6.days)
      puts "extends event"
    end
   if r.recurr = 'f'   
     r.update_attributes(:expire => "true")
     puts "expire event"
   end   
    end
  end