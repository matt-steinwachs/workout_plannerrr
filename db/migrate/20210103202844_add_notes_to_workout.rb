class AddNotesToWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :notes, :string
  end
end
