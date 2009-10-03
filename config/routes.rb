ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users
  map.resources :user_sessions
  
  map.resources :projects

  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
