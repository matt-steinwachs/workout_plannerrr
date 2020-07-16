class CycleTemplate < ApplicationRecord
  has_many :workout_templates
  has_many :block_templates, :through => :workout_templates
  has_many :round_templates, :through => :block_templates
end
