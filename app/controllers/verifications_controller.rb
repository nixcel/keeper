class VerificationsController < ApplicationController
  # GET /verifications
  # GET /verifications.xml
  def index
    @verifications = Verification.find(:all, :order => 'date ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @verifications }
    end
  end

  # GET /verifications/1
  # GET /verifications/1.xml
  def show
    @verification = Verification.find(params[:id])
        
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @verification }
    end
  end

  # GET /verifications/new
  # GET /verifications/new.xml
  def new
    @verification = Verification.new
    @verification.transactions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @verification }
    end
  end

  # GET /verifications/1/edit
  def edit
    @verification = Verification.find(params[:id])
  end

  # POST /verifications
  # POST /verifications.xml
  def create
    @verification = Verification.new(params[:verification])

    respond_to do |format|
      if @verification.save
        flash[:notice] = 'Verification was successfully created.'
        format.html { redirect_to(@verification) }
        format.xml  { render :xml => @verification, :status => :created, :location => @verification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @verification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /verifications/1
  # PUT /verifications/1.xml
  def update
    params[:verification][:existing_transactions_attr] ||= {}
    
    @verification = Verification.find(params[:id])
    respond_to do |format|
      if @verification.update_attributes(params[:verification])
        flash[:notice] = 'Verification was successfully updated.'
        format.html { redirect_to(@verification) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @verification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /verifications/1
  # DELETE /verifications/1.xml
  def destroy
    @verification = Verification.find(params[:id])
    @verification.destroy

    respond_to do |format|
      format.html { redirect_to(verifications_url) }
      format.xml  { head :ok }
    end
  end
end
