class UnitsController < ApplicationController
  def index
    @unit = Unit.new
    @units = Unit.all.page(params[:page]).per(9)
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
    params.require(:unit).permit(:material_id, :unit, :g)
  end
end
