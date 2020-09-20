class AddHideCompletedToCycleTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :cycle_templates, :hide_completed, :boolean, :default => false
  end
end
