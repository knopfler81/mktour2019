class RepliesController < ApplicationController

	before_action :find_concert

	def new
		@reply =  Reply.new
	end


	def create
		@comment = Comment.find(params[:comment_id])

		@reply =  @comment.replies.new(params_reply)
		@reply.user = current_user
		if @reply.save
			redirect_to @concert, notice: "Réponse envoyée"
		else
			redirect_to @concert, alert: "Hey il faut écrire quelque chose pour valider la réponse ^^"
		end
	end

	def edit
	end

	def update
	end


private

	def params_reply
		params.require(:reply).permit(:content, :comment_id, :user_id)
	end

	def find_concert
		@concert = Concert.find(params[:concert_id])
	end



end