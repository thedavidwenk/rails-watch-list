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
    # @movies = @List.movies
  end

  def new
    # @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path, notice: "list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def list_params 
    params.require(:list).permit(:name)
  end 
end