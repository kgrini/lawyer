class CategoriesController < ApplicationController
  def category_content
    @record =  Content.find_by_url(params[:keyword])
    @content = JSON.parse(@record.data)
    @hostname = request.host
  end
end
