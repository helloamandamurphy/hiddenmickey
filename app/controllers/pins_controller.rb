class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def new
    #check if it's nested and a proper id
    if params[:series_id] && series = Series.find_by_id(params[:series_id])
      #nested route
      @pin = series.pins.build
    else
      @pin = Pin.new
      @pin.build_series
    end
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to pin_path(@pin)
    else
      @pin.build_series unless @pin.series
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
    if @pin.update(pin_params)
      redirect_to pin_path(@pin)
    else
      render :edit
    end
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
