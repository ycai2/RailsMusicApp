class BandsController < ApplicationController
  before_action :require_user!

  def index
    @bands = Band.all
    render :index
  end

  def create

  end

  def new

  end

  def edit

  end

  def show
    render :show
  end

  def update

  end

  def destroy

  end
end
