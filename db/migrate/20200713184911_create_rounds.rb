class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.belongs_to :block, foreign_key: true
      t.string :reps
      t.integer :sets
      t.integer :weight
      t.belongs_to :round_template, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
