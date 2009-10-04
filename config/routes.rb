ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users do |user|
    user.resources :projects
  end
  map.resources :user_sessions
  
  map.resources :projects do |project|
    project.resources :calls
    project.resources :roles do |role|
      role.resources :calls
    end
  end
  map.resources :roles do |role|
    role.resources :calls
  end
  map.resources :calls
  map.resources :locations do |location|
    location.resources :calls
  end

  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
