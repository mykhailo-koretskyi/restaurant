class ReservationsController < ApplicationController
  def new
    @tables = Table.all
  end

  def create
    startTime = DateTime.parse(params[:date].to_s + 'T' + params[:start_time].to_s + ':00')
    endTime = DateTime.parse(params[:date].to_s + 'T' + params[:end_time].to_s + ':00')

    puts startTime
    puts endTime
    puts params

    reservation = Reservation.new(
        :table_id => params[:table_id],
        :user_id => session[:user_id],
        :start_time => startTime,
        :end_time => endTime
    )
    reservation.save
    redirect_to url_for ({:action => 'index', :controller => 'reservations'})
  end

  def index
    @reservations = Reservation.where('user_id = :user_id AND start_time > :date_now',
                                      {user_id: session[:user_id], date_now: DateTime.now})
  end

  def destroy
    Reservation.find(params[:id]).destroy()
    redirect_to reservations_url
  end
end
