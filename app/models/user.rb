class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username,  :message => 'already taken'
  validates_presence_of :username,  :message => "can't be blank"
  
  has_many :events, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me
  #scope :user_profile, where(:username => (params[:username]))



end
