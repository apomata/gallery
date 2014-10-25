class AddDescriptionToPorjectpictures < ActiveRecord::Migration
  def change
  	add_column :projectpictures, :description, :text
  end
end
