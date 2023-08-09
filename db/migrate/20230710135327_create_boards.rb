class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :email
      t.integer :mines
      t.integer :height
      t.integer :width
      t.text :data

      t.timestamps
    end
  end
end
