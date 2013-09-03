class StaticPagesController < ApplicationController
  def home
  end

  def uas
  end

  def officers
  end

  def pictures
  	@albums = Album.all
  end
end
