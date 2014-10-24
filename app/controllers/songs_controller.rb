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
    @song = Song.find(params[:id])
    if @song.delete
      redirect_to songs_path, notice: "Deleted!"
    else
      render songs_path, notice: "Error, please try again."
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to @song, notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song, notice: "Song Created!"
    else
      render :new
    end
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

end
