class AddViewedForMessages < ActiveRecord::Migration[5.0]
  def change
		add_column :messages, :viewed, :boolean, null: false, default: false
	end
end
