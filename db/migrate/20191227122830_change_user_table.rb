class ChangeUserTable < ActiveRecord::Migration[6.0]
	def change
		add_column :posts, :change_counter, :integer, default: 0
	end
end
