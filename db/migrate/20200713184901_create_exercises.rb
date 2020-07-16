class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.belongs_to :reference, foreign_key: true

      t.timestamps
    end
  end
end
