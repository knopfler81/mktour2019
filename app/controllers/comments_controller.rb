class CommentsController < ApplicationController

	before_action :find_concert
	before_action :authenticate_user!

	def new
		@comment =  Comment.new
	end


	def create
		@comment =  @concert.comments.new(params_comment)
		@comment.user = current_user
		if @comment.save
			redirect_to @concert
		end
	end

	def edit
	end

	def update
	end


private
	def params_comment
		params.require(:comment).permit(:content, :concert_id)
	end

	def find_concert
		@concert = Concert.find(params[:concert_id])
	end

end