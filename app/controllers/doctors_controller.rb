class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render component: 'Doctors', props: { doctors: @doctors }
  end

  def new
    @doctor =Doctor.new
    render component: 'DoctorNew', props: { doctor: @doctor }
  end

  def create
    @doctor = Doctor.new(doctor_params)
  if @doctor.save 
    redirect_to doctors_path
  else
    render component: 'DoctorNew', props: { doctor: @doctor }
  end

  def edit
    @doctor =Doctor.find(params[:id])
  render component: 'DoctorEdit', props: { doctor: @doctor }
  end

  def update
    @doctor = Doctor.find(params[:id])
  if @doctor.update(doctor_params)
    redirect_to doctors_path
  else
    render component: 'SubEdit', props: { sub: @sub }
  end

  def show
  end
end

def destroy
  @doctor = Doctor.find(params[:id])
  @doctor.destroy
  redirect_to doctors_path

  # or 
  # Sub.find(params[:id]).destroy
  # redirect_to subs_path
end

private 
   
  def doctor_params
    params.require(:doctor).permit(:name)
  end
end



