class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def index
    @song = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    if @song.delete
      redirect_to albums_path, notice: "Deleted!"
    else
      render albums_path, notice: "Error, please try again."
    end
  end

  def update
    @song = song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song, notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def create
    @song = Song.new(band_params)
    if @song.save
      redirect_to @Song, notice: "Song Created!"
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:title)
  end

end
