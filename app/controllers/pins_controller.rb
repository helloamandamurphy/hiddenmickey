class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to pin_path(@pin)
    else
      render :new
    end
  end

  def show
    set_pin
  end

  def edit
    set_pin
  end

  def update
    set_pin
    @pin.update(pin_params)
    redirect_to pin_path(@pin)
  end

  def delete
    set_pin
    @pin.destroy
    redirect_to pins_path
  end

  private

  def set_pin
    @pin = Pin.find_by(id: params[:id])
    if !@pin
      redirect_to pins_path
    end
  end

  def pin_params
    params.require(:pin).permit(:disney_num, :image, :title, :description, :series_id)
  end
end
