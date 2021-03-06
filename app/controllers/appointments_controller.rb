class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user)
  end

  def new
    @appointment = current_user.appointments.build
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      name = @appointment.name
      redirect_to appointments_path
      flash[:notice] = "Appointment created"
    else
      render 'new'
      flash[:error] = "Unable to create appointment. Please try again"
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update appointment_params
    if @appointment.save
      flash[:notice] = "Your appointment was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def appointment_params
      params.require(:appointment).permit(:name, :delete)
    end

end
