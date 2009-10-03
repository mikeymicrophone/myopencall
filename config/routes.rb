ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users
  map.resources :user_sessions
  
  map.resources :projects
  map.resources :roles do |role|
    role.resources :calls
  end
  map.resources :calls
  map.resources :locations

  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
