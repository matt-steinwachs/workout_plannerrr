class Api::V1::BlockTemplatesController < ApplicationController
  before_action :set_block_template, only: [:show, :update, :destroy]

  # GET /block_templates
  def index
    @block_templates = BlockTemplate.all

    render json: @block_templates
  end

  # GET /block_templates/1
  def show
    render json: @block_template
  end

  # POST /block_templates
  def create
    @block_template = BlockTemplate.new(block_template_params)

    if @block_template.save
      render json: @block_template, status: :created
    else
      render json: @block_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /block_templates/1
  def update
    if @block_template.update(block_template_params)
      render json: @block_template
    else
      render json: @block_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /block_templates/1
  def destroy
    @block_template.destroy
    render json: {status: "success"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block_template
      @block_template = BlockTemplate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def block_template_params
      params.require(:block_template).permit(:workout_template_id, :exercise_id)
    end
end
