class EquipmentsController < ApplicationController

  def index
    @equipments = Equipment.all
    @equipment = Equipment.new
  end

  def create
    current_user.equipments.create!(equipment_params)
    # binding.pry
    redirect_to root_path
  end
  
  def show
    @equipment = Equipment.find(params[:id])
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    equipment = Equipment.find(params[:id])
    equipment.update!(equipment_params)
    redirect_to equipment
  end
  
  private
  
  def equipment_params
    params.require(:equipment).permit(:genre, :lab_equipment_name, :maker_name, :product_name, :purchase_year, :asset_num, :price, :disposal_status, :remarks)
  end
  
end
