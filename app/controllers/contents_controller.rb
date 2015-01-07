class ContentsController < ApplicationController
  def find_contents
    @content = Content.find_by_keyword(params[:keyword])
  end
end
