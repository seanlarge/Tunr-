class BandsController < ApplicationController
  before_filter :find_band, only: [:edit, :update, :show, :destroy]
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
  end

  def update
    if @band.update(band_params)
      redirect_to @band, notice: "Successfully Updated"
    else
      render :edit
    end
  end

  def show
  end

  def index
    @bands = Band.all
  end

  def destroy
    if @band.delete
      redirect_to bands_path, notice: "Deleted!"
    else
      render bands_path, notice: "Fail!"
    end
  end

  private

  def find_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:title)
  end
end
