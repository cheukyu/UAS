module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Undergraduate Astronomical Society"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def daylightsaving?
  	User.find_by_id(1).daylight == true
  end

end