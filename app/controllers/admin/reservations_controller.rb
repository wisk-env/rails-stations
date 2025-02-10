class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find_by(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to admin_reservations_path
    elsif Reservation.exists?(unique_params)
      redirect_to admin_reservations_path, status: 400
    else
      flash[:alert] = "予約できませんでした"
      redirect_to admin_reservations_path
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to :admin_reservations
    elsif @reservation.invalid?(:step1)
    redirect_to admin_reservations_path, status: 400
    else
      flash[:alert] = "更新に失敗しました"
      render "show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "削除が完了しました"
    redirect_to :admin_reservations
  end

  private

  def unique_params
    params.permit(:date, :schedule_id, :sheet_id)
  end

  def reservation_params
    params.permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end
