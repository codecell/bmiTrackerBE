class MeasurementsController < ApplicationController
  before_action :set_program
  before_action :set_program_measurement, only: [:show, :update, :destroy]

  # GET /programs/:program_id/measurements
  def index
    json_response(@program.measurements)
  end

  # GET /programs/:program_id/measurements/:id
  def show
    json_response(@measurement)
  end

  # POST /programs/:program_id/measurements
  def create
    @program.measurements.create!(measurement_params)
    json_response(@program, :created)
  end

  # PUT /programs/:program_id/measurements/:id
  def update
    @measurement.update(measurement_params)
    head :no_content
  end

  # DELETE /programs/:program_id/measurements/:id
  def destroy
    @measurement.destroy
    head :no_content
  end

  private

  def measurement_params
    height_in_metres_squared = (params[:height].to_f/100) * (params[:height].to_f/100)
    bmi = (params[:weight].to_f / height_in_metres_squared).round(2)
    params[:bmi] = bmi

    params.permit(:height, :weight, :bmi)
  end

  def set_program
    @program = Program.find(params[:program_id])
  end

  def set_program_measurement
    @measurement = @program.measurements.find_by!(id: params[:id]) if @program
  end
end