class EmploymentsController < ApplicationController
  # GET /employments
  # GET /employments.xml
  def index
    @employments = Employment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employments }
    end
  end

  # GET /employments/1
  # GET /employments/1.xml
  def show
    @employment = Employment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employment }
    end
  end

  # GET /employments/new
  # GET /employments/new.xml
  def new
    @employment = Employment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employment }
    end
  end

  # GET /employments/1/edit
  def edit
    @employment = Employment.find(params[:id])
  end

  # POST /employments
  # POST /employments.xml
  def create
    @employment = Employment.new(params[:employment])

    respond_to do |format|
      if @employment.save
        flash[:notice] = 'Your employment has been noted.<a href="/employments/' + @employment.id.to_s + '/edit">add detail.</a>'
        format.js   { render :text => flash[:notice] }
        format.html { redirect_to(@employment) }
        format.xml  { render :xml => @employment, :status => :created, :location => @employment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employments/1
  # PUT /employments/1.xml
  def update
    @employment = Employment.find(params[:id])

    respond_to do |format|
      if @employment.update_attributes(params[:employment])
        flash[:notice] = 'Employment was successfully updated.'
        format.html { redirect_to(@employment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.xml
  def destroy
    @employment = Employment.find(params[:id])
    @employment.destroy

    respond_to do |format|
      format.html { redirect_to(employments_url) }
      format.xml  { head :ok }
    end
  end
end
