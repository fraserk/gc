class Event < ActiveRecord::Base
  validates :name, :detail, :presence => true
  
  mount_uploader :flyer, FlerUploader
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :location
  belongs_to :user
  
  accepts_nested_attributes_for :location
  
  
end
