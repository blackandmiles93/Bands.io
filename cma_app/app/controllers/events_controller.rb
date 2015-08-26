class EventsController < ApplicationController

	def search
		@events = Event.where(date: params[:date])
		render :index
	end

	def index
		@venue = Venue.all
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
		@venue = Venue.find(params[:venue_id])
		all_bands = Band.all
			if @venue.family_friendly
				@bands = all_bands.select{|b| !b.explicit_lyrics}
			else
				@bands = all_bands
			end
	end

	def create
		Event.create(event_params)
		redirect_to events_path
	end

	private
	def event_params
			params.require(:event).permit(:date,:alcohol_served,:venue_id,:band_id)
	end
end