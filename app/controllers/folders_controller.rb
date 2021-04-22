class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy, :like]

  def index

    @share = Share.all
    # if params[:query].present?
      # @folders = Folder.search_folder(params[:query])
    #   @folders = Folder.joins(:shares).where("folders.user_id = :id OR shares.user_id = :id", id: current_user.id)

    # else
    @folders = policy_scope(Folder).joins("LEFT JOIN shares ON shares.folder_id = folders.id").where("folders.user_id = :id OR shares.user_id = :id", id: current_user.id).order(:id)

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
    authorize @folder
    # raise
  end

  # def new
  #   authorize @folder
  #   @folder = Folder.new
  # end

  def create
    @folder = Folder.new(folder_params)
    @folder.user_id = current_user.id
    authorize @folder


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

  def edit
    authorize @folder
  end

  def update
    authorize @folder
    if @folder.update(folder_params)
      redirect_to folder_path(@folder)
    else
      render :index
    end
  end

  def destroy
    authorize @folder
    @folder.destroy
    redirect_to root_path
  end

  def like
    authorize @folder

    puts "liking a folder..."

    if @folder.importance
      @folder.update importance: false
    else
      @folder.update importance: true
    end

    # importance = !@folder.importance

    # @folder.update importance: importance
    # redirect_to folders_path
    # redirect_back(fallback_location: root_path)
    render json: {
      msg: 'Success'
    }
  end

  private

  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :importance, :coverimg, :user_id, :photo)
  end
end
