class HomeController < ApplicationController
  def index
    @categories = Category.select(:url, :keyword).all
    @hostname = request.host_with_port
  end
end
