class CreateWorkoutTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_templates do |t|
      t.string :name
      t.belongs_to :cycle_template, foreign_key: true

      t.timestamps
    end
  end
end
