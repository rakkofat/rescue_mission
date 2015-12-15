class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:created_at)
  end

  def show
    @question = Question.find(params[:id])
  end
end
