class AddTimedBlocksFlagToWorkout < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :timed_blocks, :boolean, :default => false
  end
end
