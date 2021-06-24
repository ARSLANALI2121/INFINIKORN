module Admin
  class CommentsController < BaseController
    before_action :set_comment

    def create		
      @comment = @project.comments.new comment_params.merge(user_id: current_user.id)	
        respond_to do |format|
          if @comment.save
            format.html { redirect_to @project , flash[:notice] = 'Comment successfully added' }
          else
            format.html {redirect_to @project, flash[:notice] = "#{@comment.errors.full_messages.to_sentence}"}
            format.js
          end
      end
    end

    def destroy
      @comment = @project.comments.find(params[:id])
      if @comment.destroy
        else
          redirect_to @project
        end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_comment
      @project = Project.find(params[:project_id])
    end
    
  end
end
