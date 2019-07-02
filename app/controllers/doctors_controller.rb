class DoctorsController < ApplicationController
  before_action :set_doctor, except: [:create, :new, :index]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:notice] = 'User was successfully created'
      render_to doctor_path(@doctor)
    else
      render :new
    end
  end


  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render_to doctor_path(@doctor)
    else
     render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if @doctor.destroy
      flash[:notice] = 'User deleted'
      redirect_to doctor_path
    end
  end


  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :identification,
                                   :professional_card, :birthdate, :speciality)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
