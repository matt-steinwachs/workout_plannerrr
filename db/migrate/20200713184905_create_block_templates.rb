class CreateBlockTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :block_templates do |t|
      t.belongs_to :workout_template, foreign_key: true
      t.belongs_to :exercise, foreign_key: true

      t.timestamps
    end
  end
end
