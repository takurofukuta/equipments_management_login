class EquipmentsController < ApplicationController
  def index
    @equipments = Equipment.all
  end

  def show
  end

  def edit
  end
  
end
