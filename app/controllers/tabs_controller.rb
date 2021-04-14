class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :update]
  # skip_before_action :verify_authenticity_token

  def index
    @tabs = Tab.all
  end

  def show; end

  def new
    # ignore
    @tab = Tab.new
  end

  def edit; end

  def create
    @tab = Tab.new(tab_params)
    if @tab.save
      # render root_path
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { msg: 'success' } }
      end
    else
      render_error
    end
  end

  # def create

  # end

  def update
    if @tab.update(tab_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @tab.destroy
    redirect_to root_path
  end

  private

  def set_tab
    @tab = Tab.find(params[:id])
  end

  def tab_params
    params.require(:tab).permit(:title, :url, :icon, :folder_id)
  end

  def render_error
    render json: { errors: @tab.errors.full_messages },
      status: :unprocessable_entity
  end
end
