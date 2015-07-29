Rails.application.routes.draw do
  
  resources :subs
  devise_for :users
 
  resources :subscriptions
  
  root 'posts#index'
  
   resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
      put "unvote", to: "posts#unvote"
    end
  end
  
end






