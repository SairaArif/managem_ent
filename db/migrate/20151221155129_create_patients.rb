class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.text :disease

      t.timestamps
    end
  end
end
