class Post < ActiveRecord::Base
    acts_as_votable
 
    
    belongs_to :user
    belongs_to :sub

    has_many :comments


    def score
        self.get_upvotes.size - self.get_downvotes.size
    end


end
