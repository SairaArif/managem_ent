class DoctorsController < ApplicationController
  before_filter :authenticate_user! #, except: [ :index]
  before_filter :set_doctor, except: [:index, :new, :create]

 
  respond_to :html
  # GET /doctors
  # GET /doctors.json
  def index
   
    @doctor = current_user.doctors.new(params[:doctor])
    #@doctors = User.find(params[:user_id]).doctors #Doctor.all
     
    if params[:search]
      @doctors = Doctor.search params[:search]
    else
     @doctors = params[:user_id].present? ? User.find(params[:user_id]).doctors : Doctor.all
  end

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doctors }
    end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @patient = Patient.new
    @patients = @doctor.patients 

    respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @doctor }
    end
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new
    
    @doctor.attachments.new

    respond_to do |format|
     format.html # new.html.erb
     format.json { render json: @doctor }
    end
  end
 
  # GET /doctors/1/edit
  def edit
    
  end

  # POST /doctors
  # POST /doctors.json
  def create

    @doctor = current_user.doctors.new(params[:doctor])

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render json: @doctor, status: :created, location: @doctor }
      else
        format.html { render action: "new" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /doctors/1
  # PUT /doctors/1.json
  def update
    

    respond_to do |format|
      if @doctor.update_attributes(params[:doctor])
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to doctors_url }
      format.json { head :no_content }
    end
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
 
end 

