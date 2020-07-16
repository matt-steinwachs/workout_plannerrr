class CreateCycleTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :cycle_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
