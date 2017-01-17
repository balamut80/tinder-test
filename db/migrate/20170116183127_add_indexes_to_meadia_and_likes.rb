class AddIndexesToMeadiaAndLikes < ActiveRecord::Migration[5.0]
  def change
		add_index :media, :user_id
		add_index :likes_photos, :user_id
  end
end
