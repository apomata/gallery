class CreateProjectpictures < ActiveRecord::Migration
  def change
    create_table :projectpictures do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
