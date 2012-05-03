class Event < ActiveRecord::Base
  validates :name, :detail, :presence => true
  
  mount_uploader :flyer, FlerUploader
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :location
  belongs_to :user
  has_many :schedules
  
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :schedules, :allow_destroy => :true
  
end
