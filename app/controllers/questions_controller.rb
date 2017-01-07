class QuestionsController < ApplicationController
  layout "admin"
  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

end
