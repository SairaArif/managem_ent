class PatientsController < ApplicationController 
  before_filter :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :set_doctor, only: [:new, :create]
  respond_to :html

 
  def index
    @patients = Patient.all

   respond_with(@patient)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    respond_with(@patient)
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_with(@patient)
  end

  # GET /patients/1/edit
  def edit
    
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = @doctor.patients.new(params[:patient])
   
    @patient.save
    redirect_to new_doctor_patient_path
     
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient.update_attributes(params[:patient])
   respond_with(@patient)
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
   
    @patient.destroy
    respond_with(@patient)
    
    end
    private 
     def set_patient
      @patient = Patient.find(params[:id])
      end 
     def set_doctor 
      @doctor = Doctor.find(params[:doctor_id])
      end 
   end
