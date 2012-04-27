class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_load_resource only: :create

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def new
    @order.order_lines.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def edit
    #@order = Order.find(params[:id])
  end

  def create
    # TODO - fix this
    # Hacky way of deleting empty order lines when an order comes in
    if params[:order][:order_lines_attributes]
      params[:order][:order_lines_attributes].each do |ol|
        if ol[1][:product_id] == "" || ol[1][:quantity_requested] == ""
          params[:order][:order_lines_attributes].delete(ol[0])
        end
      end
    end

    @order = Order.new(params[:order])
    @order.user = current_user

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
