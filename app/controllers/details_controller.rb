class DetailsController < ApplicationController
#   # map.resources :users do |user|
#   #   user.resources :projects do |project|
#   #     project.resources :details
#   #   end
#   #   user.resources :details
#   # end
#   # map.resources :user_sessions
#   # 
#   # map.resources :projects do |project|
#   #   project.resources :calls do |call|
#   #     call.resources :details
#   #   end
#   #   project.resources :roles do |role|
#   #     role.resources :calls
#   #   end
  #   project.resources :details
  # end
  # map.resources :roles do |role|
  #   role.resources :calls
  #   role.resources :details
  # end
  # map.resources :calls
  # map.resources :locations do |location|
  #   location.resources :calls
  #   location.resources :details
  # end

  # GET /details
  # GET /details.xml
  def index
    @details = if params[:user_id].present?
      if params[:project_id].present?
        User.find(params[:user_id]).projects.map(&:details).flatten.uniq
      else
        User.find(params[:user_id]).details.public
      end
    elsif params[:project_id].present?
      if params[:call_id].present?
        Call.find(params[:call_id]).details.public
      else
        Project.find(params[:project_id]).details.public
      end
      if params[:role_id].present?
        
        @calls = Call.find_all_by_role_and_and_project_id params[:role_id], params[:project_id]
        @chunked_details = @calls.map { |c| c.details.public }
        @chunked_details.flatten.uniq
        
        
        
      end
    else
      Detail.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @details }
    end
  end

  # GET /details/1
  # GET /details/1.xml
  def show
    @detail = Detail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @detail }
    end
  end

  # GET /details/new
  # GET /details/new.xml
  def new
    @detail = Detail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @detail }
    end
  end

  # GET /details/1/edit
  def edit
    @detail = Detail.find(params[:id])
  end

  # POST /details
  # POST /details.xml
  def create
    @detail = Detail.new(params[:detail].merge(:private => (params[:detail][:private] == '0'), :creator => current_user))

    respond_to do |format|
      if @detail.save
        flash[:notice] = 'Detail was successfully created.'
        format.html { redirect_to(@detail) }
        format.xml  { render :xml => @detail, :status => :created, :location => @detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /details/1
  # PUT /details/1.xml
  def update
    @detail = Detail.find(params[:id])

    respond_to do |format|
      if @detail.update_attributes(params[:detail])
        flash[:notice] = 'Detail was successfully updated.'
        format.html { redirect_to(@detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.xml
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to(details_url) }
      format.xml  { head :ok }
    end
  end
end
