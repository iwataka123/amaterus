class SchedulesController < ApplicationController

  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedule = Schedule.includes(:user)
  end
  
  def new
    @schedule = Schedule.new
  end

  def show
  end

  def create
    Schedule.create(schedule_params)
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
