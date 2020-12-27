class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program, only: [:show, :update, :destroy]

  # GET /programs
  def index
    @programs = Program.all
    json_response(@programs)
  end

  # POST /programs
  def create
    @program = Program.create!(program_params)
    json_response(@program, :created)
  end

  # GET /programs/:id
  def show
    json_response(@program)
  end

  # PUT /programs/:id
  def update
    @program.update(program_params)
    head :no_content
  end

  # DELETE /programs/:id
  def destroy
    @program.destroy
    head :no_content
  end

  private

  def program_params
    user_id = current_user.id
    params[:user_id] = user_id
    # whitelist params
    params.permit(:title, :target, :user_id)
  end

  def set_program
    @program = Program.find(params[:id])
  end
end