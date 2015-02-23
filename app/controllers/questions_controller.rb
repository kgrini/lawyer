class QuestionsController < ApplicationController
  def question_content
    @keyword = Keyword.find_by(translit: params[:keyword])
    @questions =  @keyword.questions.includes(:user).includes(:answers)
    # @content = JSON.parse(@record.data)
    @urls = Keyword.get_random_contents
  end
end
