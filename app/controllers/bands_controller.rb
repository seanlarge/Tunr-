class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to @band, notice: "Band Created!"
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to @band, notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def index
    @bands = Band.all
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.delete
      redirect_to bands_path, notice: "Deleted!"
    else
      render bands_path, notice: "Fail!"
    end
  end

  private

  def band_params
    params.require(:band).permit(:title)
  end
end
