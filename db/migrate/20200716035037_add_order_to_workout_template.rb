class AddOrderToWorkoutTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_templates, :order, :integer
  end
end
