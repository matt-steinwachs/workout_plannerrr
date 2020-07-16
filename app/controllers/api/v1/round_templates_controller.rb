class Api::V1::RoundTemplatesController < ApplicationController
  before_action :set_round_template, only: [:show, :update, :destroy]

  # GET /round_templates
  def index
    @round_templates = RoundTemplate.all

    render json: @round_templates
  end

  # GET /round_templates/1
  def show
    render json: @round_template
  end

  # POST /round_templates
  def create
    @round_template = RoundTemplate.new(round_template_params)

    if @round_template.save
      render json: @round_template, status: :created
    else
      render json: @round_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /round_templates/1
  def update
    if @round_template.update(round_template_params)
      render json: @round_template
    else
      render json: @round_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /round_templates/1
  def destroy
    @round_template.destroy
    render json: {status: "success"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round_template
      @round_template = RoundTemplate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def round_template_params
      params.require(:round_template).permit(:block_template_id, :reps, :sets, :percent, :weight)
    end
end
