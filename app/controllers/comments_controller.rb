class CommentsController < ApplicationController



	def create
		@project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
		@comment.user_id = current_user.id
		
		if @comment.save
			flash[:success] = "Comment successfully added"
		else
			render partial: "comments/comment"
		end
		redirect_to @project
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

end
