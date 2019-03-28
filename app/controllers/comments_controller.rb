class CommentsController < ApplicationController
    def create
        @job_posting = JobPosting.find(params[:job_posting_id])
        @comment = @job_posting.comments.create(comment_params)
        redirect_to job_posting_path(@job_posting)
    end

    private
    def comment_params 
        params.require(:comment).permit(:title, :body)
    end
end
