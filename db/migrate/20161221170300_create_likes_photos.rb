class CreateLikesPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :likes_photos do |t|
			t.integer :user_id
			t.integer :media_id
			t.integer :media_user_id
			t.boolean :like
			t.timestamps
		end
  end
end
