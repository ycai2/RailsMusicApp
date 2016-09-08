class BandsController < ApplicationController
  before_action :require_user
  before_action :current_band, only: [:edit, :show, :update]

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
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
    @albums = current_band.albums
    render :show
  end

  def update
    @band.name = band_params[:name]
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    current_band.destroy
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

  def current_band
    @band ||= Band.find(params[:id])
  end
end
