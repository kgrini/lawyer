class HomeController < ApplicationController
  def index
    @keywords = Keyword.select(:translit, :keyword).joins(questions: :user).uniq(:id).order("RAND()").first(21)
    @hostname = request.host_with_port
  end
end
