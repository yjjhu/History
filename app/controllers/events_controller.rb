class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]#在執行特定方法時先值行:set_event
  # GET /events
  def index
    @events = Event.order("category_id, date_begin DESC").page(params[:page]).per(20)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @department = @event.departments
  end

  # GET /events/new
  def new
    @event = Event.new
    @categories = Category.all
    @departments = Department.all
  end

  # GET /events/1/edit
  def edit
    @categories = Category.all
    @departments = Department.all
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    #資料來源：http://millarian.com/rails/quick-tip-has_many-through-checkboxes/
    @event.attributes = {'department_ids' => []}.merge(params[:event] || {})

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: '新增成功' }
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: '更新成功' }
      else
        format.html { render :edit }
      end
    end
    
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:category_id, :date_begin, :date_end, :content, :great, :privacy)
    end
end
