class Comment < ActiveRecord::Base
    
    acts_as_votable
    
    
    belongs_to :user, :foreign_key => "user_id"
    belongs_to :post, :foreign_key => "post_id"
    
    belongs_to :parent, :class_name  => "Comment", :foreign_key => "parent_comment_id"
    has_many :replies, :class_name => "Comment", :foreign_key => "parent_comment_id"  
    
    
    def score
        self.get_upvotes.size - self.get_downvotes.size
    end
end
