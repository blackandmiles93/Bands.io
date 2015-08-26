class BandsController < ApplicationController

	def index
		@bands=Band.all
	end

	def show
		@band = Band.find(params[:id])
	end

# the def new means that we are creating a new instance of band in which the information that is provided from the new page adds it to the database.
	def new
		@band = Band.new
	end

	def create
		Band.create(band_params)
		redirect_to bands_path
	end

# private limits the values coming through so that people cannot add things to your database.
	private

	def band_params
		params.require(:band).permit(:name,:genre,:explicit_lyrics)
	end
	
end