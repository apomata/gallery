class CreateUserprojects < ActiveRecord::Migration
  def change
    create_table :userprojects do |t|
      t.integer :profile_id
      t.integer :project_id

      t.timestamps
    end
  end
end
