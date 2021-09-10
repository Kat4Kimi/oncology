class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    render component: 'Patients', props: { patients: @patients }
  end

  def new
    @patient = Patient.new
    render component: 'PatientNew', props: { patient: @patient }
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path
    else
      render component: 'PatientNew', props: { patient: @patient }
    end
  end

  def edit
    @patient = Sub.find(params[:id])
    render component: 'PatientEdit', props: { patient: @patient }
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to patients_path
  end

  def show
    @patient = Patient.find(params[:id])
    render component: 'Patient', props: { patients: @patients }
  end
end

def destroy
  @patient = Patient.find(params[:id])
  @patient.destroy
  redirect_to patients_path
end

private 

  def patient_params
    params.require(:patient).permit(:name)
  end
end








