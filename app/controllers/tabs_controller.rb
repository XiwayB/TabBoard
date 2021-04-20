class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :update, :destroy]
  # after_action :verify_authorized, except: [:index]
  # skip_before_action :verify_authenticity_token

  def index
    # skip_authorization
    @tabs = policy_scope(Tab)

    @tabs = @tabs.search_tab(params[:query]) if params[:query].present?

    tabs = @tabs.map{|tab| tab.to_hashy }

    respond_to do |format|
      format.html
      format.json { render json: tabs }
    end
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
    authorize @tab
    if @tab.update(tab_params)
      redirect_to root_path
    else
      render_error
    end
  end

  def destroy
    authorize @tab
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
