class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  # GET /subs
  # GET /subs.json
  def index
    @subs = Sub.all
  end


  def mySubscriptions
    @subs = current_user.subs  
  end




  # GET /subs/1
  # GET /subs/1.json
  def show
    @subscription = Subscription.new
  end

  def subscribedusers
    @user = Sub.find(params[:id]).users
  end
  


  # GET /subs/new
  def new
    @sub = current_user.subs.build
  end
  
  
  # GET /subs/1/edit
  def edit
  end

  # POST /subs
  # POST /subs.json
  def create
    @sub = current_user.subs.build(sub_params)

      if @sub.save
        redirect_to @sub, notice: 'Sub was successfully created.' 
        
      else
        render :new 
      end
    
  end

  # PATCH/PUT /subs/1
  # PATCH/PUT /subs/1.json
  def update
   
      if @sub.update(sub_params)
         redirect_to @sub, notice: 'Sub was successfully updated.' 
      else
        render :edit 
      end
  end
  

  def destroy
    @sub.destroy
    redirect_to subs_url, notice: 'Sub was successfully destroyed.' 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub
      @sub = Sub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_params
      params.require(:sub).permit(:title)
    end
end
