class TellsFortuneController < ApplicationController
  def questions
    @count = 0
    session[:selected_question] = []
    session[:selected_answer] = []
    session[:selected_question] = [*(0..25)].sample(10)
    @question = QUESTIONS[session[:selected_question].drop(@count.to_i)[0]]
  end

  def result
    @answer = params[:person][:answer]
    session[:selected_answer] << @answer
    @count = params[:count].to_i + 1
    if session[:selected_question].drop(@count.to_i).present?
      @question = QUESTIONS[session[:selected_question].drop(@count.to_i)[0]]
    else
      @result = RESULT.sample
    end
  end
end