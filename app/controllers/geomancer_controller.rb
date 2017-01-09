class GeomancerController < ApplicationController

 # GET /submissions/new
  def new
    @submission = Submission.new
  end
  
  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to @submission, notice: 'Submission was successfully created.'
    else
      render :new
    end
  end
end
