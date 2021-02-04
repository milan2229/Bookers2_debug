Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
# get "users/show_follower.html.erb" => "users#show_follower"
# get "users/show_followed.html.erb" => "users#show_followed"
  resources :users do
    get "users/follower" => "users#follower"
    get "users/followed" => "users#followed"
end


  # resource :relationships, only:[:create, :destroy]


post 'follow/:id' => 'relationships#follow', as: 'follow'
delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :books do
     resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
   end



end