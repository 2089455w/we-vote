Rails.application.routes.draw do
  
  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
      put "unvote", to: "comments#unvote"
    end
  end
  
  resources :subs do
    collection do 
      get 'mySubscriptions'
    end
  end
  
  get 'subs/:id/subscribedusers' => "subs#subscribedusers"
  
  
  devise_for :users
 
  resources :subscriptions
  

  
  
  
  root 'subs#index'
  
   resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
      put "unvote", to: "posts#unvote"
    end
  end
  
end






