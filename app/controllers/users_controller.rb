class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@announcement = current_user.announcements.build if signed_in?
  	@announcements = @user.announcements.paginate(:page => params[:a_page], :per_page => 10)
  	@album = Album.new
  	@albums = Album.all
  end

end
