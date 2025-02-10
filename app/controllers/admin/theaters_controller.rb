class Admin::TheatersController < ApplicationController
  def index
    @theaters = Theater.all
  end

  def new
    @theater = Theater.new
  end

  def create
    @theater = Theater.new(theater_params)
    if @theater.save
      redirect_to :admin_theaters
    else
      flash[:alert] = "新規登録に失敗しました"
      render "new"
    end
  end

  private

  def theater_params
    params.require(:theater).permit(:name)
  end
end
