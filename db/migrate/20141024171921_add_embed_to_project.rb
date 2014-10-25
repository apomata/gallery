class AddEmbedToProject < ActiveRecord::Migration
	def change
		add_column :projects, :embedcode, :text
	end
end
