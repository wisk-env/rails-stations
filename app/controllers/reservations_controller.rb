class ReservationsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @theater = Theater.find(params[:theater_id])
    @schedule = Schedule.find(params[:schedule_id])
    @screen = Screen.find(@schedule.screen_id)
    # @date = params[:date]
    @date = @schedule.start_time
    @sheet = Sheet.find(params[:sheet_id])
    @user = current_user
    unless @date.present? && sheet_params.present?
      render status: 400 and return
    end
    # unless date_params.present? && sheet_params.present?
    #   render status: 400 and return
    # end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @theater = Theater.find(params[:theater_id])
    # @date = params[:date]
    @schedule = Schedule.find(params[:schedule_id])
    @date = @schedule.start_time
    @reservation = Reservation.new(reservation_params)
    @email = params[:email]
    @name = params[:name]
    @correct_user = User.find_by(id: current_user.id, email: @email, name: @name)
    if @correct_user.nil?
      flash[:alert] = "予約できませんでした"
      redirect_to movie_theater_schedule_reservation_path(@movie, @theater, date: @date, schedule_id: @schedule.id)
    elsif @correct_user && @reservation.save
      ReservationMailer.admin_reply(@reservation).deliver
      redirect_to movie_path(@movie)
    else
      flash[:alert] = "予約できませんでした"
      redirect_to movie_theater_schedule_reservation_path(@movie, @theater, date: @date, schedule_id: @schedule.id)
    end
    # if @reservation.save
    #   # ReservationMailer.admin_reply(user, @reservation).deliver
    #   redirect_to movie_path(@movie)
    # else
    #   flash[:alert] = "予約できませんでした"
    #   # redirect_to movie_reservation_path(@movie, date: params[:reservation][:date], schedule_id: @schedule.id)
    #   redirect_to movie_theater_schedule_reservation_path(@movie, @theater, date: @date, schedule_id: @schedule.id)
    # end
  end
  
  private

  def date_params
    params.permit(:date)
  end

  def sheet_params
    params.permit(:sheet_id)
  end

  def reservation_params
    params.permit(:date, :schedule_id, :sheet_id, :email, :name, :movie_id, :theater_id, :screen_id)
  end
end
