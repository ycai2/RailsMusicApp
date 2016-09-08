class BandsController < ApplicationController
  before_action :require_user!

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_param)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
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
    params.require(:band).permit(:name)
  end
end
