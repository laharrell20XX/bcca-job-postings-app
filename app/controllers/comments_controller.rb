class CommentsController < ApplicationController
    before_action :is_admin, only: [:create]
    def create
        @job_posting = JobPosting.find(params[:job_posting_id])
        @comment = @job_posting.comments.create(comment_params)
        if @admin
            redirect_to admin_job_posting_path(@job_posting)
        else
            redirect_to user_job_posting_path(@job_posting)
        end
    end

    private
    def comment_params 
        params.require(:comment).permit(:title, :body)
    end

    def is_admin
        port = request.fullpath.split("/")[1]
        @admin = (port == "admin")
    end
end
