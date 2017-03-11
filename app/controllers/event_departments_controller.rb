class EventDepartmentsController < ApplicationController

  before_action :set_event, only: [:hh1, :hh2,]#在執行特定方法時先值行:set_event

  def index
    @events = Event.where(privacy:"f",great:"t").order("date_begin DESC")
  end

  def show
    @event = Event.find(params[:id])
    @department = @event.departments
  end

  def hh1
  end

  def hh2
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      year_ids = params[:date][:year] unless params[:date].nil?
      @events = Event.where(privacy:"f").order("date_begin DESC").search(year_ids).page(params[:page]).per(10)
      @categories = Category.all
      @departments = Department.all
    end

end