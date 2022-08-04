class UnitsController < ApplicationController
  def index
    @units = Unit.all
  end

  def create
    unit = Unit.new(unit_params)
    unit.save
    redirect_to units_path
  end

  def destroy
    unit = Unit.find(params[:id])
    unit.destroy
    redirect_to units_path
  end

  private

  def unit_params
    params.require(:unit).permit(:unit_name,:g)
  end
end
