class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
  acts_as_voter
  
  has_many :posts
  has_many :subs
  has_many :comments
  has_many :subscriptions
end
