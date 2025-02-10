class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.new
    @theater = Theater.find(params[:theater_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to admin_movie_path(@schedule.movie_id)
    else
      flash[:alert] = "新規登録に失敗しました"
      render "new"
    end
  end

  def show
    @movie = Movie.find_by(params[:movie_id])
    @schedule = Schedule.find_by(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to :admin_movie
    else
      flash[:alert] = "更新に失敗しました"
      render :admin_movie_schedule
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to :admin_movies
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :movie_id, :theater_id, :screen_id)
  end
end
