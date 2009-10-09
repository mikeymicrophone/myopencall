class InvolvementsController < ApplicationController
  # GET /involvements
  # GET /involvements.xml
  def index
    @involvements = Involvement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @involvements }
    end
  end

  # GET /involvements/1
  # GET /involvements/1.xml
  def show
    @involvement = Involvement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @involvement }
    end
  end

  # GET /involvements/new
  # GET /involvements/new.xml
  def new
    @involvement = Involvement.new params[:involvement]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @involvement }
    end
  end

  # GET /involvements/1/edit
  def edit
    @involvement = Involvement.find(params[:id])
  end

  # POST /involvements
  # POST /involvements.xml
  def create
    @involvement = Involvement.new(params[:involvement].merge(:creator => current_user))

    respond_to do |format|
      if @involvement.save
        flash[:notice] = 'Your involvemet has been noted. <a href="/involvements/' + @involvement.id.to_s + '/edit">add detail.</a>'
        format.js   { render :text => flash[:notice]}
        format.html { redirect_to(@involvement) }
        format.xml  { render :xml => @involvement, :status => :created, :location => @involvement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @involvement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /involvements/1
  # PUT /involvements/1.xml
  def update
    @involvement = Involvement.find(params[:id])

    respond_to do |format|
      if @involvement.update_attributes(params[:involvement])
        flash[:notice] = 'Involvement was successfully updated.'
        format.html { redirect_to(@involvement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @involvement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /involvements/1
  # DELETE /involvements/1.xml
  def destroy
    @involvement = Involvement.find(params[:id])
    @involvement.destroy

    respond_to do |format|
      format.html { redirect_to(involvements_url) }
      format.xml  { head :ok }
    end
  end
end
