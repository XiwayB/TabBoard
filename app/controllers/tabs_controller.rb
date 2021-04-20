class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :update]
  # skip_before_action :verify_authenticity_token

  def index
    @tabs = Tab.all
    @tabs = Tab.search_tab(params[:query]) if params[:query].present?
    tabs = @tabs.map { |tab| tab.to_hashy }

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

  def save_all
    tabs = params.require(:tabs)[:content]
    puts "tabs?? #{tabs}"
    @tabs = tabs.map do |tab|
      @tab = Tab.new(title: tab[:title], url: tab[:url], icon: tab[:iconUrl], folder_id: tab[:folder_id])
      @tab.save
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { msg: 'success', tabs: @tabs } }
    end
  end

# DO NOT REMOVE COMMENT BELOW - INVISIBLE BUG
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

  def many_tabs_params
    params.require(:tabs).permit(:content => [])
  end
end
