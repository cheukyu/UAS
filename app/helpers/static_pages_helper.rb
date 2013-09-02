module StaticPagesHelper

  def daylightsaving?
  	User.find_by_id(1).daylight == true
  end
end
