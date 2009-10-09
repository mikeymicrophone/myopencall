ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users do |user|
    user.resources :projects do |project|
      project.resources :details
    end
    user.resources :details
  end
  map.resources :user_sessions
  
  map.resources :projects do |project|
    project.resources :calls do |call|
      call.resources :details
    end
    project.resources :roles do |role|
      role.resources :calls
    end
    project.resources :details
  end
  map.resources :roles do |role|
    role.resources :calls
    role.resources :details
  end
  map.resources :calls
  map.resources :locations do |location|
    location.resources :calls
    location.resources :details
  end
  
  map.resources :details

  map.resources :interests

  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
