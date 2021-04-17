class EquipmentsController < ApplicationController
  PER_PAGE = 20

  def index
    @q = Equipment.ransack(params[:q])
    @equipments = @q.result.page(params[:page]).per(PER_PAGE)
    @equipment = Equipment.new
  end

  def create
    current_user.equipments.create!(equipment_params)
    OperationHistory.create_log(current_user.id, "#{equipment_params[:lab_equipment_name]}を登録しました")
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
    OperationHistory.create_log(current_user.id, "#{equipment_params[:lab_equipment_name]}を編集しました")
    redirect_to equipment
  end

  def destroy
    equipment = Equipment.find(params[:id])
    equipment.destroy!
    OperationHistory.create_log(current_user.id, "#{equipment.lab_equipment_name}を削除しました")
    redirect_to root_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:genre, :lab_equipment_name, :maker_name, :product_name, :purchase_year, :asset_num, :price, :disposal_status, :remarks)
  end
end
