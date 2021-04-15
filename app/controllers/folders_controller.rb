class FoldersController < ApplicationController
  before_action :set_folder, only: [ :show, :edit, :update, :destroy ]
  def index
    if params[:query].present?
      @folders = Folder.search_folder(params[:query])
    else
      @folders = Folder.all
    end
    # @folders = Folder.all
    @folder = Folder.new
    # @folder.destroy
  end

  def show
    @tab = Tab.new
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
    redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @folder.update(folder_params)
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    @folder.destroy
    redirect_to root_path
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :importance, :coverimg, :user_id, :photo)
  end

end
