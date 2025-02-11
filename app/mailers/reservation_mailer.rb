class ReservationMailer < ApplicationMailer
  def admin_reply(reservation)
    @reservation = reservation
    @theater = Theater.find(reservation.theater_id)
    @movie = Movie.find(reservation.movie_id)
    @schedule = Schedule.find(reservation.schedule_id)
    @sheet = Sheet.find(reservation.sheet_id)
    mail to: @reservation.email, subject: '【映画予約内容のお知らせ】'
  end
end
