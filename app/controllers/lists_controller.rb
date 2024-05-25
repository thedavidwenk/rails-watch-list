class ListsController < ApplicationController
  def index
    @lists = List.all 
    @list = List.new

    if @lists.empty?
      @status = "No lists yet. Please add a new list"
    else
      @status = "You have #{@lists.length} movie lists"
    end 
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    # @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to root_path, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private 

  def list_params 
    params.require(:list).permit(:name, :photo)
  end 
end