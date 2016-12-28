class CreateViewedPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :viewed_photos do |t|
			t.integer :user_id
			t.integer :media_id
			t.datetime :showed_at
		end
  end
end
