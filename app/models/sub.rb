class Sub < ActiveRecord::Base
    belongs_to :user
    
    
    has_many :posts
    has_many :subscrptions
    has_many :users, :through => :subscrptions
    
   
end
