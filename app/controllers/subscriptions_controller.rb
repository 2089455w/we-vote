class SubscriptionsController < ApplicationController
        before_action :find_subscription, only: [:show, :edit, :update, :destroy]



    def index
        @subscriptions = Subscription.all
        
    end
    
    def new
        @subscription = current_user.subscriptions.build
    end
    
    
    def create
        @subscription = current_user.subscriptions.build(subscription_params)
    
    
        if @subscription.save
            redirect_to @subscription, notice: "Successfully create new subscription"
        
        else
            render 'new'
        end
    end
    
    
    def show
    end
    
    def edit
    end
    
    def update
        if @subscription.update(subscription_params)
            redirect_to @subscription, notice: "Subscription was successfully updated"
        else
            render 'edit'
        end
    end
    
  
    
    def destroy
        @subscription.destroy
        redirect_to root_path
    end
    
    
    
    
    
    private
    
    def subscription_params
    
        params.require(:subscription).permit(:sub_id)
    end
    

    def find_subscription
        @subscription = Subscription.find(params[:id])
    end

end
