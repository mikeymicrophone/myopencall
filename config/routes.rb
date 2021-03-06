ActionController::Routing::Routes.draw do |map|
  map.resources :wysihat_files

  map.resources :users do |user|
    user.resources :projects do |project|
      project.resources :details
    end
    user.resources :details
    user.resources :roles
    user.resources :involvements
    user.resources :appointments
    user.resources :friendships
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
    company.resources :involvements
    company.resources :appointments
    company.resources :businesses
    company.resources :cities
    company.resources :states
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
    project.resources :involvements
    project.resources :companies
  end
  map.resources :involvements
  map.resources :roles do |role|
    role.resources :calls
    role.resources :details
  end
  map.resources :calls do |call|
    call.resources :appointments
  end
  map.resources :locations do |location|
    location.resources :calls
    location.resources :details
  end
  
  map.resources :appointments
  
  map.resources :states do |state|
    state.resources :calls
    state.resources :cities
    state.resources :locations
    state.resources :businesses
    state.resources :companies
    state.resources :employees
  end
  map.resources :cities do |city|
    city.resources :calls
    city.resources :locations
    city.resources :businesses
    city.resources :companies
  end
  
  map.resources :businesses do |business|
    business.resources :cities
    business.resources :companies
    business.resources :employees
    business.resources :users
    business.resources :projects
    business.resources :calls
    business.resources :roles
  end
  
  map.resources :details

  map.resources :interests
  
  map.resources :friendships, :collection => {:requests => :get}
  map.resources :followerships
  map.resources :favorites
  map.root :controller => 'user_sessions', :action => 'new'  
  # map.login :controller => 'user_sessions', :action => 'new'
  # map.logout :controller => 'user_sessions', :action => 'destroy'
  # map.signup :controller => 'users', :action => 'new'
end
