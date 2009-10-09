class ActivationsController < ApplicationController
  before_filter :require_no_user
  skip_before_filter :require_user

  def create
    flash_error = lambda do |str|
      flash[:notice] = str
      raise str
    end
    
    flash_error['Token must be provided'] unless params[:activation_code]
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || flash_error['No user with token']
    flash_error['User already active'] if @user.active?
    flash_error['Token does not match user'] unless @user.id == params[:id].to_i

    if @user.activate!
      flash[:notice] = 'Activated'
      @user.deliver_activation_confirmation!
      UserSession.create @user
      redirect_to root_url
    else
      flash[:notice] = 'Incorrect activation code'
      render :action => :new
    end
  end

end