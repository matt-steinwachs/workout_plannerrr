class WorkoutTemplate < ApplicationRecord
  belongs_to :cycle_template, optional: true
  has_many :workouts

  has_many :block_templates, :dependent => :destroy
  has_many :round_templates, :through => :block_templates

  accepts_nested_attributes_for :block_templates, :allow_destroy => true

  before_validation(on: :create) do
    if self.cycle_template_id.present?
      self.order = (
        WorkoutTemplate.where(
          :cycle_template_id => self.cycle_template_id
        ).maximum(:order)+1
      )
    end
  end
end
