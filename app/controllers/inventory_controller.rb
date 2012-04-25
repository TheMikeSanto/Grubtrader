class InventoryController < ApplicationController
	before_filter :authenticate_user!
  # GET /inventories
  # GET /inventories.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventories }
    end
  end
end
