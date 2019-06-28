class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.save

    redirect_to pins_path(@pin)
  end

  def show
    @pin = Pin.find_by(id: params[:id])
  end

  def edit
    @pin = Pin.find_by(id: params[:id])
  end

  def update
    @pin = Pin.find_by(id: params[:id])
    @pin.update(pin_params)
    redirect_to pin_path(@pin)
  end

  def delete
    @pin.destroy
    render '/'
  end

  private

  def pin_params
    params.require(:pin).permit(:disney_id, :image, :title, :description)
  end
end
