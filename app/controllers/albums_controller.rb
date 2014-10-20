class AlbumsController < ApplicationController
  before_filter :set_album, only: [:show, :edit, :update, :destroy]
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album, notice: "Successfully Added"
    else
      render :new, notice: 'Album did not save'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    if @album.delete
      redirect_to albums_path, notice: "Deleted!"
    else
      render albums_path, notice: "Fail!"
    end
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :year)
  end

end #end of class
