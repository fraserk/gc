class Location < ActiveRecord::Base
validates :location_name, :presence => true
has_many :events
#accepts_nested_attributes_for :events, :allow_destroy => :true
end
