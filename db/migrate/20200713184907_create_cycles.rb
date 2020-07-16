class CreateCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :cycles do |t|
      t.string :name
      t.belongs_to :cycle_template, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.string :references

      t.timestamps
    end
  end
end
