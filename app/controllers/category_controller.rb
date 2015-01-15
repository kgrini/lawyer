class CategoryController < ApplicationController
  def category_content
    @record =  Category.find_by_url(params[:keyword])
    @content = JSON.parse(@record.data)
    @urls = @record.get_random_contents
  end
end
