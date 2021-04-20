class SharesController < ApplicationController

  before_action :set_folder, only: [:new, :create]
  # before_action :share_params, only: [:new]

  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
    @share.folder = @folder

  end

  def create
    @share = Share.new(share_params)
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
    params.require(:share).permit(:user_id)
  end


end

