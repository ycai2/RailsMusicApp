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
    @band = Band.find(params[:id])
    @albums = Album.where(band_id: params[:id])
    render :show
  end

  def update

  end

  def destroy

  end

  private
  def band_param

  end
end
