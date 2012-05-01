class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
end
