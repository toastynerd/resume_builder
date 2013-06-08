class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.string :description
      t.date :start_at
      t.date :end_at
      t.references :resume 

      t.timestamps
    end
    add_index :educations, :resume_id
  end
end
