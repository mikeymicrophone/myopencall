ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users do |user|
    user.resources :projects do |project|
      project.resources :details
    end
    user.resources :details
    user.resources :roles
  end
  map.resources :user_sessions
  map.resources :password_resets
  map.activate '/activate/:id/:activation_code', :controller => 'activations', :action => 'create'
  
  
  map.resources :companies do |company|
    company.resources :users
    company.resources :projects do |project|
      project.resources :calls
      project.resources :roles
    end
    company.resources :employments
  end
  
  map.resources :employments
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
  
  map.resources :states
  map.resources :cities
  
  map.resources :details

  map.resources :interests

  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
