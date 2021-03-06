class TracksController < ApplicationController
  before_action :require_user
  before_action :current_track, only: [:edit, :show, :update]

  def new
    @track = Track.new(album_id: params[:album_id])
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash.now[:errors] = @track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def edit
    @albums = Album.all
    render :edit
  end

  def show
    @track = current_track
    render :show
  end

  def update

    if @track.update(track_params)
      redirect_to album_url(@track.album_id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    current_track.destroy
    redirect_to album_url(@track.album_id)
  end

  private
  def track_params
    params.require(:track).permit(:name, :bonus, :lyrics, :album_id)
  end

  def current_track
    @track ||= Track.find(params[:id])
  end
end
