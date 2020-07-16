class Api::V1::WorkoutTemplatesController < ApplicationController
  before_action :set_workout_template, only: [:show, :update, :destroy]

  # GET /workout_templates
  def index
    @workout_templates = WorkoutTemplate.order(:cycle_template_id,:order).eager_load(block_templates: {round_templates:{}, exercise:{reference:{}}}).all

    render json: package(@workout_templates)
  end

  # GET /workout_templates/1
  def show
    render json: @workout_template
  end

  # POST /workout_templates
  def create
    @workout_template = WorkoutTemplate.new(workout_template_params)

    if @workout_template.save
      render json: package(@workout_template), status: :created
    else
      render json: @workout_template.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workout_templates/1
  def update
    if @workout_template.update(workout_template_params)
      render json: package(@workout_template)
    else
      render json: @workout_template.errors, status: :unprocessable_entity
    end
  end

  # POST /workout_templates/reorder
  def reorder
    params[:workout_templates].each do |wt|
      w = WorkoutTemplate.find(wt[:id])
      w.order = wt[:order]
      w.save!
    end

    @workout_templates = WorkoutTemplate.order(:cycle_template_id,:order).eager_load(block_templates: {round_templates:{}, exercise:{reference:{}}}).all

    render json: package(@workout_templates)
  end

  # DELETE /workout_templates/1
  def destroy
    @workout_template.destroy
    render json: {status: "success"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_template
      @workout_template = WorkoutTemplate.find(params[:id])
    end

    def package(records)
      records.as_json(include: {
        block_templates: { include: {
          exercise: { include: {
            reference: {}
          }},
          round_templates: {}
        }}
      })
    end

    # Only allow a trusted parameter "white list" through.
    def workout_template_params
      params.require(:workout_template).permit(
        :name, :cycle_template_id, :order,
        { block_templates_attributes: [
          :_destroy,
          :id,
          :exercise_id,
          { round_templates_attributes: [ :_destroy, :id, :block_template_id, :reps, :sets, :percent, :weight] }
        ]}
      )
    end
end
