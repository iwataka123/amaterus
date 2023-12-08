class SchedulesController < ApplicationController

  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedule = current_user.schedules.includes(:user)
    @schedules = current_user.schedules.includes(:user)
    @today_schedule = current_user.schedules.where("DATE(start_time) = ?", Date.today)
  end
  
  def new
    @schedule = Schedule.new
    @schedules = current_user.schedules.includes(:user)
    @today_schedule = current_user.schedules.where("DATE(start_time) = ?", Date.today)
  end

  def show
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
    render :new
    end
  end

  def destroy
    @schedule.destroy
  end

  def edit
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
    else
      render 'new'
    end
  end

  def update
    unless @schedule.update(schedule_params)
      render 'edit'
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end
end
