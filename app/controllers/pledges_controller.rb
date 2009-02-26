class PledgesController < ApplicationController
  before_filter :login_required
  
  # GET /pledges
  # GET /pledges.xml
  def index
    @pledges = current_user.pledges

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pledges }
    end
  end

  # GET /pledges/1
  # GET /pledges/1.xml
  def show
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pledge }
    end
  end

  # GET /pledges/new
  # GET /pledges/new.xml
  def new
    @organization = Organization.find([@_params[:org]])
    @pledge = Pledge.new
    line_item1 = PledgeLineItem.new(:amount => 50, :description => "Donate to #{@organization.name}")
    line_item2 = PledgeLineItem.new(:amount => 10, :description => "Donate to SaveTogether")
    @pledge.pledge_line_items = [line_item1, line_item2]
    @pledge.organization = @organization[0]
    
    # TAB - this needs to be updated to use javascript in the html form
    @total = [50, 10].sum

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pledge }
    end
  end

  # GET /pledges/1/edit
  def edit
    @pledge = Pledge.find(params[:id])
  end

  # POST /pledges
  # POST /pledges.xml
  def create
    line_item1 = PledgeLineItem.create(:amount => params[:amount0])
    line_item2 = PledgeLineItem.create(:amount => params[:amount1])
    @pledge.pledge_line_items = [line_item1, line_item2]
    @pledge.user = current_user
    @pledge.organization = Organization.find(params[:org])

    respond_to do |format|
      if @pledge.save
        flash[:notice] = 'Pledge was successfully created.'
        format.html { redirect_to(@pledge) }
        format.xml  { render :xml => @pledge, :status => :created, :location => @pledge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pledges/1
  # PUT /pledges/1.xml
  def update
    @pledge = Pledge.find(params[:id])

    respond_to do |format|
      if @pledge.update_attributes(params[:pledge])
        flash[:notice] = 'Pledge was successfully updated.'
        format.html { redirect_to(@pledge) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pledge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pledges/1
  # DELETE /pledges/1.xml
  def destroy
    @pledge = Pledge.find(params[:id])
    @pledge.destroy

    respond_to do |format|
      format.html { redirect_to(pledges_url) }
      format.xml  { head :ok }
    end
  end
end
