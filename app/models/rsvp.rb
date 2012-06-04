class Rsvp < ActiveRecord::Base

validates_uniqueness_of :event_id, :on => :create, :message => "must be unique"
 #  friendly_id :name, use: :slugged
	belongs_to :event
end
