class ConcertsController < ApplicationController

	before_action :authenticate_user! only: [:new, :create]

	def index
		@concerts = Concert.order('show_date ASC')
	end

	def show
		@concert = Concert.find(params[:id])
		@comment = Comment.new
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(concert_params)
		if @concert.save
			redirect_to concerts_path
		end
	end

	def edit
		@concert = Concert.find(params[:id])
	end

	def update
		@concert = Concert.find(params[:id])
		if @concert.update_attributes(concert_params)
			redirect_to @concert, notice: "Good"
		end
	end

	def register
	  @concert = Concert.find(params[:id])
	  user = User.find(params[:user_id])
	  @concert.users << user # adding the user
	end


	def unsubscribe
	 @concert = Concert.find(params[:id])
	  user = User.find(params[:user_id])
	  @concert.users.delete(user)
	end

	private
	def concert_params
		params.require(:concert).permit(:id, :show_date, :city)
	end
end
