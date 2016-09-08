class AlbumsController < ApplicationController
  before_action :require_user
  before_action :current_album, only: [:edit, :show, :update]

  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @bands = Band.all
    render :edit
  end

  def show
    @tracks = current_album.tracks
    render :show
  end

  def update
    @album.update(album_params)
    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def destroy
    current_album.destroy
    redirect_to band_url(@album.band_id)
  end

  private
  def album_params
    params.require(:album).permit(:name, :yr, :live)
  end

  def current_album
    @album ||= Album.find(params[:id])
  end
end
