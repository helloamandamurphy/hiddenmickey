class SeriesController < ApplicationController
  def index
    @series = Series.order_by_year
  end

  def new
    @series = Series.new
  end

  def create
    @series = Series.new(series_params)
    @series = current_user.series.build(series_params)

    if @series.save
      redirect_to series_path(@series)
    else
      render :new
    end
  end

  def show
    set_series
  end

  def edit
    set_series
  end

  def update
    set_series
    @series.update(series_params)
    redirect_to series_path(@series)
  end

  def delete
    set_series
    @series.destroy
    redirect_to series_path
  end

  private
  def set_series
    @series = Series.find_by(id: params[:id])
    if !@series
      redirect_to series_path
    end
  end

  def series_params
    params.require(:series).permit(:release_year, :name, :number_in_set)
  end
end
