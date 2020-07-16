class Workout < ApplicationRecord
  belongs_to :cycle
  belongs_to :workout_template
  has_many :blocks, :dependent => :destroy

  accepts_nested_attributes_for :blocks, :allow_destroy => true

  after_create :build_associations

  private
    def build_associations
      unless self.start.present?
        self.start = self.created_at
        self.save

        self.workout_template.block_templates.each do |bt|
          b = Block.create(
            :workout_id => self.id,
            :block_template_id => bt.id,
            :exercise_id => bt.exercise_id
          )

          bt.round_templates.each do |rt|
            weight = (
              rt.percent.present? ? (
                (self.cycle.references.select{|r| r["id"] == b.exercise.reference_id}.first["value"].to_f * rt.percent).round()
              )
              : rt.weight.present? ? rt.weight
              : nil
            )

            r = Round.create(
              :block_id => b.id,
              :round_template_id => rt.id,
              :reps => rt.reps,
              :sets => rt.sets,
              :weight => weight
            )
          end
        end
      end
    end
end
