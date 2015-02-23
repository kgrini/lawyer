class HomeController < ApplicationController
  def index
    @keywords = Keyword.select(:translit, :keyword).order("RAND()").first(21)
    @hostname = request.host_with_port
  end
end
