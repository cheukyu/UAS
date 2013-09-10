class ChangeTextLimit < ActiveRecord::Migration
  def change
  	change_column :announcements, :content, :text, :limit => nil
  end
end
