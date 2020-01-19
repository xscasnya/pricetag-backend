class CalculationController < ApplicationController

  def calculate

  end

  private

  def calculation_params
    params.require(:prices).permit!
  end
end