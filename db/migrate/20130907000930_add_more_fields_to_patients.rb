class AddMoreFieldsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :sex, :string, :limit => 1
    add_column :patients, :image_file_name, :string
  end
end
