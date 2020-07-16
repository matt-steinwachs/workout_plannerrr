class BlockTemplate < ApplicationRecord
  belongs_to :workout_template
  belongs_to :exercise

  has_many :round_templates, :dependent => :destroy

  accepts_nested_attributes_for :round_templates, :allow_destroy => true
end
