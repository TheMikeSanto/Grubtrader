class OrganizationsController < ApplicationController
  load_and_authorize_resource
  # GET /organizations
  # GET /organizations.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization.role_id = OrganizationRole.producer_role_id
    @organization.settings = {admin_role_ids: [current_user.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    #@organization = Organization.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization.role_id = OrganizationRole.producer_role_id
    @organization.settings = {admin_role_ids: [current_user.id]}

    respond_to do |format|
      if @organization.save
        if user_signed_in?
          format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        else
          format.html { redirect_to new_user_registration_path({user: {organization_id: @organization.id, 
                                                                        email: @organization.email,
                                                                        phone: @organization.phone
                                                                      }
                                                                })}
        end
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html { render action: "new" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :ok }
    end
  end
end
