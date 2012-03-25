class DonationLinesController < ApplicationController
  # GET /donation_lines
  # GET /donation_lines.json
  def index
    @donation_lines = DonationLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donation_lines }
    end
  end

  # GET /donation_lines/1
  # GET /donation_lines/1.json
  def show
    @donation_line = DonationLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation_line }
    end
  end

  # GET /donation_lines/new
  # GET /donation_lines/new.json
  def new
    @donation_line = DonationLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation_line }
    end
  end

  # GET /donation_lines/1/edit
  def edit
    @donation_line = DonationLine.find(params[:id])
  end

  # POST /donation_lines
  # POST /donation_lines.json
  def create
    @donation_line = DonationLine.new(params[:donation_line])

    respond_to do |format|
      if @donation_line.save
        format.html { redirect_to @donation_line, notice: 'Donation line was successfully created.' }
        format.json { render json: @donation_line, status: :created, location: @donation_line }
      else
        format.html { render action: "new" }
        format.json { render json: @donation_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donation_lines/1
  # PUT /donation_lines/1.json
  def update
    @donation_line = DonationLine.find(params[:id])

    respond_to do |format|
      if @donation_line.update_attributes(params[:donation_line])
        format.html { redirect_to @donation_line, notice: 'Donation line was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_lines/1
  # DELETE /donation_lines/1.json
  def destroy
    @donation_line = DonationLine.find(params[:id])
    @donation_line.destroy

    respond_to do |format|
      format.html { redirect_to donation_lines_url }
      format.json { head :ok }
    end
  end
end
