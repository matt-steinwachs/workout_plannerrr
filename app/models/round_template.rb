class RoundTemplate < ApplicationRecord
  belongs_to :block_template
  has_many :rounds
end
