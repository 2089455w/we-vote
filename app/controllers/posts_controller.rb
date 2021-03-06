class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]



    def index
        @posts = Post.all
        
    end
    
    def new
        @post = current_user.posts.build
        
        @sub = Sub.find(params[:sub_id])
    
    end
    
    
    
    def create
        @post = current_user.posts.build(post_params)
    
    
        if @post.save
            redirect_to @post, notice: "Successfully create new post"
        
        else
            render 'new'
        end
    end
    
    
    def show
        @comment = Comment.new
        gon.comments = @post.comments.each
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post was successfully updated"
        else
            render 'edit'
        end
    end
    
    
    
    def upvote
        @post = Post.find(params[:id])
        @post.upvote_by current_user
        redirect_to @post
    end
    
    def downvote
        @post = Post.find(params[:id])
        @post.downvote_by current_user
        redirect_to @post
    end
    
    
    def unvote
        @post = Post.find(params[:id])
        @post.unvote_by current_user
        redirect_to @post
    end
    
    
  
    
    def destroy
        @post.destroy
        redirect_to root_path
    end
    
    
    
    
    
    private
    
    def post_params
    
        params.require(:post).permit(:title,:sub_id)
    end
    

    def find_post
        @post = Post.find(params[:id])
    end

end
