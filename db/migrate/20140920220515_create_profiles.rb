class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :email
      t.string :image_url

      t.timestamps
    end
  end
end
