class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :update, :edit, :destroy]
  # after_action :verify_authorized, except: [:index]
  # skip_before_action :verify_authenticity_token

  def index
    # skip_authorization
    @tabs = policy_scope(Tab)
    # current_user should allow user to only see their own folders/tabs
    @tabs = current_user.tabs.search_tab(params[:query]) if params[:query].present? 

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

  def edit
    authorize @tab
  end

  def create
    puts "current_user : #{current_user.email}"
    @tab = Tab.new(tab_params)
    @folder = @tab.folder_id
    authorize @tab
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
    authorize :tab, :save_all?
    tabs = params.require(:tabs)[:content]
    puts "tabs?? #{tabs}"
    @tabs = tabs.map do |tab|
      @tab = Tab.new(title: tab[:title], url: tab[:url], icon: tab[:icon])
      @tab.folder = Folder.find(params[:folder_id])
      @tab.save!

      unless @tab.valid?
        puts "errors ===>> #{@tab.errors.full_messages}"
      end
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { msg: 'success', tabs: @tabs } }
    end
  end

  def unsaved_tabs
    authorize :tab, :unsaved_tabs?
    @unsaved_tabs = current_user.tabs.joins(:folder).where(:folders => {name:'Default'})
    render json: { tabs: @unsaved_tabs.map{|tab| tab.to_hashy } }
  end

  def destroy_unsaved_tabs
    authorize :tab, :unsaved_tabs?
    @unsaved_tabs = current_user.tabs.joins(:folder).where(:folders => {name:'Default'})
    @unsaved_tabs.destroy_all
    render json: { tabs: @unsaved_tabs.map{|tab| tab.to_hashy } }
  end

# DO NOT REMOVE COMMENT BELOW - INVISIBLE BUG
  # def create
  # end

  def update
    authorize @tab
    @folder = @tab.folder_id
    respond_to do |format|
      if @tab.update(tab_params)
        format.html { redirect_to folder_path(@folder), notice: 'Tab was successfully updated.' }
        format.json { render :show, status: :ok, location: @tab }
      else
        format.html { render :edit }
        format.json { render json: @tab.errors, status: :unprocessable_entity }
      end
    end
    # if @tab.update(tab_params)
    #   redirect_to root_path
    # else
    #   render_error
    # end
  end

  def destroy
    authorize @tab
    @folder = @tab.folder_id
    @tab.destroy
    respond_to do |format|
      format.html { redirect_to folder_path(@folder), notice: 'Tab was successfully destroyed.' }
      format.json { render json: {msg: 'Deleted'} }
    end

    # @tab.destroy
    # redirect_to folder_tabs_path notice: 'Tab was successfully destroyed.'
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
