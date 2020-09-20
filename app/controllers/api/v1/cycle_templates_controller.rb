class Api::V1::CycleTemplatesController < ApplicationController
  before_action :set_cycle_template, only: [:show, :update, :destroy]

  # GET /cycle_templates
  def index
    @cycle_templates = CycleTemplate.eager_load(workout_templates: {block_templates: {round_templates: {}, exercise: {reference: {}}}}).all

    render json: package(@cycle_templates)
  end

  # GET /cycle_templates/1
  def show
    render json: package(@cycle_template)
  end

  # POST /cycle_templates
  def create
    @cycle_template = CycleTemplate.new(cycle_template_params)

    if @cycle_template.save
      render json: package(@cycle_template), status: :created
    else
      render json: @cycle_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cycle_templates/1
  def update
    if @cycle_template.update(cycle_template_params)
      render json: package(@cycle_template)
    else
      render json: @cycle_template.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cycle_templates/1
  def destroy
    @cycle_template.destroy
    render json: {status: "success"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle_template
      @cycle_template = CycleTemplate.find(params[:id])
    end

    def package(record)
      record.as_json(include: {
        workout_templates: { include: {
          block_templates: { include: {
            exercise: { include: {
              reference: {}
            }},
            round_templates: {}
          }}
        }}
      })
    end

    # Only allow a trusted parameter "white list" through.
    def cycle_template_params
      params.require(:cycle_template).permit(:name, :hide_completed)
    end
end
