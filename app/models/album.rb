class Album < ActiveRecord::Base
	image_accessor :cover_image            # 'image_accessor' is provided by Dragonfly
                                          # this defines a reader/writer for cover_image
    default_scope -> { order('created_at DESC') }
    validates :name,  presence: true
    validates :cover_image, presence: true
end
