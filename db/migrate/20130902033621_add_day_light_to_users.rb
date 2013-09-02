class AddDayLightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :daylight, :boolean, :default => true
  end
end
