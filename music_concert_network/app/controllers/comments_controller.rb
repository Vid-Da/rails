class CommentsController < ApplicationController

	def new
		@concert = Concert.find_by(id: params[:concert_id])
		@comment = @concert.comments.new
	end

	def create
		@concert = Concert.find(params[:concert_id])
		@comment = @concert.comments.new(comment_params)

		if @comment.save
			flash[:notice] = "Comment created successfully"
			redirect_to action: 'show', controller: 'concerts', id: @concert.id
		else
			flash[:alert] = "Sorry, something went wrong.."
			render 'new'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

end
