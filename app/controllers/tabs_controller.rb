class TabsController < ApplicationController

  def index
    @tabs = Tab.all
  end

  def show; end

  def new
    @tab = Tab.new
  end

end
