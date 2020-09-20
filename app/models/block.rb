class Block < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  belongs_to :block_template, optional: true
  has_many :rounds, :dependent => :destroy

  accepts_nested_attributes_for :rounds, :allow_destroy => true
end
