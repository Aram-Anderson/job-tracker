class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    @comment.save
    redirect_to company_job_path(@comment.job.company_id, @comment.job_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :job_id)
  end
end
