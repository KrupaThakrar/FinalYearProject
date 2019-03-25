class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  
  before_action :find_appointment

  def index
    @bookings = Booking.where("appointment_id = ? AND end_time >= ?", @appointment.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(appointment_id: @appointment.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:email, :appointment_id, :start_time, :length))
    @booking.appointment = @appointment
    if @booking.save
      redirect_to appointment_bookings_path(@appointment, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to appointment_bookings_path(@appointment)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.appointment = @appointment

    if @booking.update(params[:booking].permit(:email, :appointment_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to appointment_bookings_path(@appointment)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to appointment_booking_path(@appointment, @booking)
      else
        render 'new'
      end
  end

  def find_appointment
    if params[:appointment_id]
      @appointment = Appointment.find_by_id(params[:appointment_id])
    end
  end

end
