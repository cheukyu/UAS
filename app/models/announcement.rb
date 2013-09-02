class Announcement < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :title, presence: true, length: { minimum: 5 }
	validates :content, presence: true, length: { minimum: 20 }
end
