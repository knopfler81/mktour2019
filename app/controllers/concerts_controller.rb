class ConcertsController < ApplicationController

	def index
		filter_concerts if params[:query].present?
		@concerts ||= Concert.order('show_date ASC')
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
		else
			render :new, alert: "Olalala tu fais de merde ou quoi ??? "
		end
	end

	def edit
		@concert = Concert.find(params[:id])
	end

	#def update
		# @concert = Concert.find(params[:id])
		# if @concert.update_attributes(concert_params)
		# 	redirect_to @concert, notice: "Good"
		# end
		def update
			@concert = Concert.find(params[:concert_id])
		  @comment = Comment.find params[:id]

		  respond_to do |format|
		    if @comment.update(update_comment_params)
		      format.html { redirect_to(@concert, notice: 'Comment was successfully updated.') }
		      format.json { respond_with_bip(@concert) }
		    else
		      format.html { render action: "edit" }
		      format.json { respond_with_bip(@concert) }
		    end
		  end
		end
#	end

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
		params.require(:concert).permit(:id, :show_date, :venue, :kountry, :city)
	end


	def filter_concerts
		return if params[:query].blank?
		@concerts = Concert.where('lower(kountry) LIKE ?', "%#{params[:query][:keyword].downcase }%")
			.or(Concert.where('lower(city) LIKE ?', "%#{params[:query][:keyword].downcase }%"))
	end
end
