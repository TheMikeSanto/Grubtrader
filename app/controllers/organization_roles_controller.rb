class OrganizationRolesController < ApplicationController
  # GET /organization_roles
  # GET /organization_roles.json
  def index
    @organization_roles = OrganizationRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organization_roles }
    end
  end

  # GET /organization_roles/1
  # GET /organization_roles/1.json
  def show
    @organization_role = OrganizationRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization_role }
    end
  end

  # GET /organization_roles/new
  # GET /organization_roles/new.json
  def new
    @organization_role = OrganizationRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization_role }
    end
  end

  # GET /organization_roles/1/edit
  def edit
    @organization_role = OrganizationRole.find(params[:id])
  end

  # POST /organization_roles
  # POST /organization_roles.json
  def create
    @organization_role = OrganizationRole.new(params[:organization_role])

    respond_to do |format|
      if @organization_role.save
        format.html { redirect_to @organization_role, notice: 'Organization role was successfully created.' }
        format.json { render json: @organization_role, status: :created, location: @organization_role }
      else
        format.html { render action: "new" }
        format.json { render json: @organization_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organization_roles/1
  # PUT /organization_roles/1.json
  def update
    @organization_role = OrganizationRole.find(params[:id])

    respond_to do |format|
      if @organization_role.update_attributes(params[:organization_role])
        format.html { redirect_to @organization_role, notice: 'Organization role was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_roles/1
  # DELETE /organization_roles/1.json
  def destroy
    @organization_role = OrganizationRole.find(params[:id])
    @organization_role.destroy

    respond_to do |format|
      format.html { redirect_to organization_roles_url }
      format.json { head :ok }
    end
  end
end
