class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:sort] && params[:sort] == "location"
      @jobs = Job.all.order(city: :asc)
    elsif params[:sort] && params[:sort] == "interest"
      @jobs = Job.all.order(level_of_interest: :desc)
    elsif params[:location]
      @jobs = Job.where(city: params[:location])
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)

    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      flash[:failure] = "A field was not filled out"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
    @tags = Tag.all
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    if
      @job.update(job_params)

      flash[:success] = "#{@job.title} at #{@company.name} was successfully updated!"
      redirect_to company_path(@company)
    else
      flash[:failure] = "A field was not filled out"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @company = @job.company
    @job.destroy

    flash[:success] = "#{@job.title} at #{@company.name} was successfully deleted!"

    redirect_to company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, tag_ids: [])
  end
end
