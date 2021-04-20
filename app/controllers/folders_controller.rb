class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @share = Share.all
    # if params[:query].present?
      # @folders = Folder.search_folder(params[:query])
    #   @folders = Folder.joins(:shares).where("folders.user_id = :id OR shares.user_id = :id", id: current_user.id)

    # else
      @folders = Folder.joins("LEFT JOIN shares ON shares.folder_id = folders.id").where("folders.user_id = :id OR shares.user_id = :id", id: current_user.id)

      # @folders = Folder.where(user_id: 4).or(Folder.where(user_id: 1))
    # end
    @folder = Folder.new
    # returns a response to the get request
    # to confirm success. To display all folders
    # in chrome extension
    respond_to do |format|
      format.html
      format.json { render json: @folders }
    end
  end

  def show
    @tab = Tab.new
    @share = Share.new
    @users = User.all
    # raise
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      # returns a response to the post request
      # to confirm success. To create new folder
      # from chrome extension
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
