#require 'dragonfly/rails/images'

require 'dragonfly'
app = Dragonfly[:images]
 
app.configure_with(:imagemagick)
app.configure_with(:rails)

 
if Rails.env.production?
app.configure_with(:heroku, 'UAS_Website')
app.datastore.configure do |c|
# Prohibit images from being accessed directly from S3 by the public.
# In conjunction with protect_from_dos_attacks (see below), this allows
# our rails app to enforce access, e.g. to allow access to a 64x64 thumbnail
# but prohibit access to the original image.
c.storage_headers = {'x-amz-acl' => 'private'}
end
end
 
app.configure do |c|
# Make it effectively impossible to guess valid image URLs
c.protect_from_dos_attacks = true
# Amazon CloudFront does not allow query params, so put sha in the url itself
c.url_format = '/media/:job/:sha/:basename.:format'
# This secret should be unique to your app. Use SecureRandom.hex(64) to make one.
c.secret = '647a89d8714be672d77427efb7a2a691b55276ddae5307ed6c22ba00919f9fcbe19aa839373f9b697e10f4e2471e63669d18a35b852e5d0f01307fb58070a44d'
end
 
app.define_macro(ActiveRecord::Base, :image_accessor)