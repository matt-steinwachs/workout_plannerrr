class Api::V1::CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :update, :destroy]

  # GET /cycles
  def index
    @cycles = Cycle.eager_load(workouts: { blocks: {rounds: {}, exercise:{}}}).all

    render json: package(@cycles)
  end

  # GET /cycles/1
  def show
    render json: @cycle
  end

  # POST /cycles
  def create
    @cycle = Cycle.new(cycle_params)

    if @cycle.save
      render json: package(@cycle), status: :created
    else
      render json: @cycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cycles/1
  def update
    if @cycle.update(cycle_params)
      render json: package(@cycle)
    else
      render json: @cycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cycles/1
  def destroy
    @cycle.destroy
    render json: {status: "success"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    def package(records)
      records.as_json(include: {
        workouts: { include: {
          blocks: { include: {
            exercise: {},
            rounds: {}
          }},
        }}
      })
    end

    # Only allow a trusted parameter "white list" through.
    def cycle_params
      params.require(:cycle).permit(
        :name, :cycle_template_id, :start, :end,
        { workouts_attributes: [
          :_destroy,
          :id,
          :name,
          :notes,
          :workout_template_id,
          :end,
          { blocks_attributes: [
            :_destroy,
            :id,
            :exercise_id,
            { rounds_attributes: [
              :_destroy,
              :id,
              :reps,
              :sets,
              :percent,
              :weight
            ]}
          ]}
        ]}
      )
    end
end
