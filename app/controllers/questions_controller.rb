class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      # flash[:notice] = 'Question was successfully created.'
      # redirect_to @question
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
