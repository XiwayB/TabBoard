class SharesController < ApplicationController

  before_action :set_folder, only: [:new, :create]
  # before_action :share_params, only: [:new]

  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
    authorize @share, :new?
    @share.folder = @folder

  end

  def create
    @share = Share.new(share_params)
    authorize @share, :create?

    # @share.user = User.find_by(email: share_params[:email])
    @share.user = User.find(share_params[:user_id])
    @share.folder = @folder
    if @share.save
      redirect_to folder_path(@share.folder)
    else
      # puts @folder.errors.full_messages
      render "folders/show"
    end

  end


  private

  def set_folder
    @folder = Folder.find(params[:folder_id])
  end

  def share_params
    params.require(:share).permit(:user_id, :email)
  end


end

