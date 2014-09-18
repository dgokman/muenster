require 'pry'
class JobsController < ApplicationController

  def index

    @jobs = Job.order("updated_at DESC")
    @companies = Company.all
  end

  def show
    @jobs_all = Job.all
    @jobs = Job.find(params[:id])

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save

    redirect_to @job
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update

    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @jobs_all = Job.all
    @jobs_all.delete_all(id: params[:id])

    redirect_to '/jobs'
  end

  private

  def job_params
    params.require(:job).permit(:title, :company_id, :description)
  end
end
