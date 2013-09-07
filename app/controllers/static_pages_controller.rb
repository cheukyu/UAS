class StaticPagesController < ApplicationController
  def home
  	@announcements = Announcement.paginate(:page => params[:page], :per_page => 5)
  end

  def uas
  end

  def officers
  end

  def pictures
  	#@albums = Album.all
  	@albums = Album.paginate(:page => params[:page], :per_page => 4)
  end
end
