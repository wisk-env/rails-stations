class SchedulesController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @theater = Theater.find(params[:theater_id])
    @schedules = Schedule.all.where(theater_id: @theater.id, movie_id: @movie.id)
  end
end
