class DonationsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: :create
  # GET /donations
  # GET /donations.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @donation.donation_lines.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    #@donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    if params[:donation][:donation_lines_attributes]
      params[:donation][:donation_lines_attributes].each do |dl|
        if dl[1][:product_id] == "" || dl[1][:quantity] == "" || dl[1][:picked_date] == ""
          params[:donation][:donation_lines_attributes].delete(dl[0])
        end
      end
    end
    
    @donation = Donation.new(params[:donation])
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "new" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :ok }
    end
  end
end
