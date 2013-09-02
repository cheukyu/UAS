class AnnouncementsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]




	def create
		@announcement = current_user.announcements.build(announcement_params)
		if @announcement.save
			flash[:success] = "Announcement created!"
			redirect_to :back
		else
			flash[:error] = "Failed to create announcement!
			 Check for the minimum characters requirements!"
			redirect_to :back
		end
	end

	def destroy
		@announcementd = Announcement.find_by(id: params[:id])
		@announcementd.destroy
		flash[:success] = "Announcement deleted!"
		redirect_to :back
	end

	private
		def announcement_params
			params.require(:announcement).permit(:title, :content)
		end

end