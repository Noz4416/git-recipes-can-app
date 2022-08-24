class UnitsController < ApplicationController
  def index
    @unit = Unit.new
    @units = Unit.all
    @materials = Material.all
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save
    redirect_to units_path
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
    redirect_to units_path
  end

  private

  def unit_params
    params.require(:unit).permit(:unit_name,:unit,:g)
  end
end
