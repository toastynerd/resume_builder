class EducationsController < ApplicationController
  before_filter :find_resume
  before_filter :find_education, :only => [:show, :edit, :update, :destroy]

  def new
    @education = @resume.educations.build
  end

  def create
    @education = @resume.educations.build(params[:education])
    if @education.save 
      flash[:notice]="Created new education."
      redirect_to @resume
    else
      flash[:alert]="Could not create education."
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
    if @education.update_attributes(params[:education])
      flash[:notice]="Updated education."
      redirect_to @resume
    else
      flash[:alert]="Could not update education."
      render :action => "edit"
    end
  end

  def destroy
    @education.destroy
    flash[:notice]="Education deleted."
    redirect_to @resume
  end
private
  def find_resume
    @resume = Resume.find(params[:resume_id])
  end

  def find_education
    @education = @resume.educations.find(params[:id])
  end
end
