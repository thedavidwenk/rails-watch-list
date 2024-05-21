class BookmarksController < ApplicationController

  # def new
  #   @bookmark = Bookmark.new
  #   @list = List.find(params[:list_id])
  #   @movie = Movie.find(params[:movie_id])
  # end 

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
   
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: 422
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
