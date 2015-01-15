class ContentsController < ApplicationController
  def find_content
    @record =  Content.find_by_url(params[:keyword])
    @content = JSON.parse(@record.data)
    @urls = @record.get_random_contents
  end
end
