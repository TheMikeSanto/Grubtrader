class Users::RegistrationsController < Devise::RegistrationsController
	
  def new
  @user = User.new(params[:user])

	  respond_to do |format|
	    format.html # new.html.erb
	    format.json { render json: @user }
	  end
  end
end