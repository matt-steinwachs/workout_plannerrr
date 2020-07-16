class Cycle < ApplicationRecord
  belongs_to :cycle_template
  has_many :workouts, :dependent => :destroy
  has_many :blocks, :through => :workouts
  has_many :rounds, :through => :blocks

  before_validation(on: :create) do
    unless self.start.present?
      self.start = Time.now
      self.references = Reference.all.as_json
    end
  end

  serialize :references, JSON

  accepts_nested_attributes_for :workouts, :allow_destroy => true
end
