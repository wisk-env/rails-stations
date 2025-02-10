class Admin::ScreensController < ApplicationController
  def index
    @theater = Theater.find_by(id: params[:theater_id])
    @screens = @theater.screens
  end

  def new
    @theater = Theater.find(params[:theater_id])
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to admin_theater_screens_path(@screen.theater_id)
    else
      flash[:alert] = "新規登録に失敗しました"
      render "new"
    end
  end

  private

  def screen_params
    params.require(:screen).permit(:number, :theater_id)
  end
end
