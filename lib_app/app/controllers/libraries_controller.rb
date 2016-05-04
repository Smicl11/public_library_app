class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    render :index
  end

  def new
    @library = Library.new
    render :new
  end

  def create
    library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
    @library = Library.create(library_params)

    redirect_to libraries_path
  end

  def show
    @library = Library.find_by_id(params[:id])
    render :show
  end

  def create
    @library = Library.find(params[:library_id])
    @library.users.push(current_user)

    redirect_to current_user
  end

end
