class AlbumsController < ApplicationController
	def create
		@album = Album.new(album_params)
		if @album.save
			flash[:success] = "Album created!"
			redirect_to :back
		else
			flash[:error] = "Failed to create album!  
			Make sure you have included a title and selected a image file!"
			redirect_to :back
		end
	end

	#def show
	#	@album = Album.find(params[:id])
	#	@albums = Album.all
	#end
	
	def destroy

		Album.find(params[:id]).destroy
		flash[:success] = "Album deleted!"
		redirect_to :back
	end

	private
		def album_params
			params.require(:album).permit(:name, :Url)
		end
end