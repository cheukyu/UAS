class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name

      t.timestamps
    end
    add_column :albums, :cover_image_uid,  :string
	add_column :albums, :cover_image_name, :string  # Optional - only if you want urls
                                                # to end with the original filename
    add_index :albums, [:created_at]
  end
end
