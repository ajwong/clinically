class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :given_name
      t.date :born_on
      t.string :uri
      t.text :description

      t.timestamps
    end
  end
end
