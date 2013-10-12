class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :category
      t.text :description
      t.datetime :deadline_at
      t.datetime :completed_at
      t.references :patient, index: true

      t.timestamps
    end
  end
end
