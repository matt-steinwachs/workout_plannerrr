class CreateRoundTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :round_templates do |t|
      t.belongs_to :block_template, foreign_key: true
      t.string :reps
      t.integer :sets
      t.float :percent
      t.integer :weight

      t.timestamps
    end
  end
end
