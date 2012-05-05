class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
    @daily_orders = Order.where(created_at: Date.today).count
    @daily_donations = Donation.where(created_at: Date.today).count
    @weekly_orders = Order.where("created_at > ?", 1.week.ago).count
    @weekly_donations = Donation.where("created_at > ?", 1.week.ago).count
    @monthly_orders = Order.where("created_at > ?", 1.month.ago).count
    @monthly_donations = Donation.where("created_at >?", 1.month.ago).count
    @yearly_orders = Order.where("created_at > ?", 1.year.ago).count
    @yearly_donations = Donation.where("created_at >?", 1.year.ago).count
    @all_orders = Order.all.count
    @all_donations = Donation.all.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end
end
