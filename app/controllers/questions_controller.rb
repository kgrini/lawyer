class QuestionsController < ApplicationController
  def question_content
    @keyword = Keyword.find_by(translit: params[:keyword])
    @questions =  @keyword.with_questions_and_users
    @urls = Keyword.select_21_link_in_random_order
  end
end
