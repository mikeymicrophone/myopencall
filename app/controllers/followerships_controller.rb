class FollowershipsController < ApplicationController
  # GET /followerships
  # GET /followerships.xml
  def index
    @followerships = if current_user
      @following = current_user.followers
      current_user.followeds
    else
      []
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @followerships }
    end
  end

  # GET /followerships/1
  # GET /followerships/1.xml
  def show
    @followership = Followership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @followership }
    end
  end

  # GET /followerships/new
  # GET /followerships/new.xml
  def new
    @followership = Followership.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @followership }
    end
  end

  # GET /followerships/1/edit
  def edit
    @followership = Followership.find(params[:id])
  end

  # POST /followerships
  # POST /followerships.xml
  def create
    @followership = Followership.new(params[:followership].merge(:follower_id => current_user.id, :status => 'following'))

    respond_to do |format|
      if @followership.save
        flash[:notice] = "you are following #{@followership.followed.name}"
        format.js   { render :text => flash[:notice] }
        format.html { redirect_to(@followership) }
        format.xml  { render :xml => @followership, :status => :created, :location => @followership }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @followership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /followerships/1
  # PUT /followerships/1.xml
  def update
    @followership = Followership.find(params[:id])

    respond_to do |format|
      if @followership.update_attributes(params[:followership])
        flash[:notice] = 'Followership was successfully updated.'
        format.html { redirect_to(@followership) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @followership.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /followerships/1
  # DELETE /followerships/1.xml
  def destroy
    @followership = Followership.find(params[:id])
    @followership.destroy

    respond_to do |format|
      format.html { redirect_to(followerships_url) }
      format.xml  { head :ok }
    end
  end
end
