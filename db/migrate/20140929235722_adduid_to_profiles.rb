class AdduidToProfiles < ActiveRecord::Migration
  def change
  	 add_column :profiles, :uid, :string
  end
end
