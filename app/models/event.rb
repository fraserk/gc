class Event < ActiveRecord::Base
  validates :name, :detail, :event_date, :presence => true
  
  mount_uploader :flyer, FlerUploader
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :location
  belongs_to :user
  has_many :rsvps
  
  accepts_nested_attributes_for :location
  #scope :active_event, 
  
end
