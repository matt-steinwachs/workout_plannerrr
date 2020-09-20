class AddIntervalsToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :work_interval, :integer
    add_column :rounds, :rest_interval, :integer
  end
end
