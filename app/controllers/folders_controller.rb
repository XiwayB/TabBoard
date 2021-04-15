class FoldersController < ApplicationController
  before_action :set_folder, only: [ :show, :edit, :update, :destroy ]

  def index
    @folders = Folder.all
    @folder = Folder.new
    # @folder.destroy
    respond_to do |format|
      format.html
      format.json { render json: @folders }
    end
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
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { msg: 'success', folder: @folder } }
      end
    else
      puts @folder.errors.full_messages
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
