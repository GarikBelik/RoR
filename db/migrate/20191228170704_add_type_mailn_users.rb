class AddTypeMailnUsers < ActiveRecord::Migration[6.0]
  def change
		add_column :users, :last_send, :datetime
		add_column :users, :type_mailing, :integer, default: 2
  end
end
