class MoviesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @movies = Movie.search(search_params[:keyword])
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    @schedules = @movie.schedules
    @theaters = Theater.all
  end

  def search
    @results = @q.result
  end

  def reservation
    @movie = Movie.find(params[:movie_id])
    @theater = Theater.find(params[:theater_id])
    @sheets_a = Sheet.limit(5)
    @sheets_b = Sheet.limit(5).offset(5)
    @sheets_c = Sheet.limit(5).offset(10)

    @date = Schedule.find(params[:schedule_id]).start_time
    @schedule = Schedule.find(params[:schedule_id])
    unless @date.present? && scheduleid_params.present?
      redirect_to movie_path(@movie)
    end
    @reservations = Reservation.all
  end

  # 初級
  # def reservation
  #   @movie = Movie.find_by(params[:id])
  #   @sheets = Sheet.all
  #   @date = params[:date]
  #   @schedule = Schedule.find_by(params[:schedule_id])
  #   unless date_params.present? && scheduleid_params.present?
  #     redirect_to movie_path(@movie)
  #   end
  # end

  private

  def set_q
    @q = Movie.ransack(params[:q])
  end

  def search_params
    params.permit(:keyword)
  end

  def date_params
    params.permit(:date)
  end

  def scheduleid_params
    params.permit(:schedule_id)
  end
end
