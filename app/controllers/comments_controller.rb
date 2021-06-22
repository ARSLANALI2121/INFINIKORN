class CommentsController < ApplicationController
	before_action :set_comment
	def create		
    @comment = @project.comments.new(comment_params)	
		@comment.user_id = current_user.id
			respond_to do |format|
				if @comment.save
					format.html { redirect_to @project , flash[:success] = "Comment successfully added" }
			end
			format.js
		end
	end

	def destroy
		@comment = @project.comments.find(params[:id])
		 @comment.destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

	def set_comment
		@project = Project.find(params[:project_id])
	end

end
