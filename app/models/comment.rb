class Comment < ActiveRecord::Base
    belongs_to :user, :foreign_key => "user_id"
    belongs_to :post, :foreign_key => "post_id"
    
    belongs_to :parent, :class_name  => "Comment", :foreign_key => "parent_comment_id"
    has_many :replies, :class_name => "Comment", :foreign_key => "parent_comment_id"  
end
