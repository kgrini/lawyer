class HomeController < ApplicationController
  def index
    @keywords = Keyword.select_21_link_in_random_order
    @hostname = request.host_with_port
  end
end
