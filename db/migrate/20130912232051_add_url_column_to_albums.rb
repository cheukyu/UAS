class AddUrlColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :Url, :string
  end
end
