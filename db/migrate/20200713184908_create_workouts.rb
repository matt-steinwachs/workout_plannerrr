class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name
      t.belongs_to :cycle, foreign_key: true
      t.belongs_to :workout_template, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
