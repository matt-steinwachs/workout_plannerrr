class Round < ApplicationRecord
  belongs_to :block
  belongs_to :round_template, optional: true
end
