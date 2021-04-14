class TabsController < ApplicationController
  before_action :set_tabs, only: %i[ show edit update destroy ]

  def index
    @tabs = Tab.all
  end

  def show; end

  def new
    @tab = Tab.new
  end

  def edit
  end

  def create
    @tab = Tab.new(tab_params)

    respond_to do |format|
      if @tab.save
        render json: { html: render_to_string(partial: 'random') }
      else
        render_error
      end
    end
  end

  private

  def render_error
    render json: { errors: @tab.errors.full_messages },
      status: :unprocessable_entity
  end
end
