class ResumesController < ApplicationController
  before_filter :find_resume, :only => [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(params[:resume])
    if @resume.save
      flash[:notice]="Created a new resume #{@resume.name}"
      redirect_to @resume
    else
      flash[:alert]="Could not create resume."
      render :action => "new"
    end
  end

  def show
    #
  end

  def edit
    #
  end

  def update
    if @resume.update_attributes(params[:resume])
      flash[:notice]="Resume info has been updated."
      redirect_to @resume
    else
      flash[:alert]="Could not update resume."
      render :action => "edit"
    end
  end 

  def destroy
    @resume.destroy
    flash[:notice]="Resume has been deleted."
    redirect_to root_path
  end

private
  def find_resume
    @resume = Resume.find(params[:id])
  end

end
