class ContentsController < ApplicationController
  def find_content
    @record =  Content.find_by_url(params[:keyword])
    @content = JSON.parse(@record.data)
  end
end
