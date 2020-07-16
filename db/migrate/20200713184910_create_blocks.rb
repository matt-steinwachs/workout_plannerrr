class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.belongs_to :workout, foreign_key: true
      t.belongs_to :exercise, foreign_key: true
      t.belongs_to :block_template, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
