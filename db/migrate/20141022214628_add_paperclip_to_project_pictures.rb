class AddPaperclipToProjectPictures < ActiveRecord::Migration
 def self.up
    change_table :projectpictures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :projectpictures, :picture
  end
end
