class EquipmentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  require 'csv'

  PER_PAGE = 20

  def index
    @q = Equipment.ransack(params[:q])
    @equipments = @q.result.page(params[:page]).per(PER_PAGE).order("#{sort_column} #{sort_direction}")
    @equipment = Equipment.new

    @equipments_csv = Equipment.all
    respond_to do |format|
      format.html
      format.csv do |csv|
      send_equipments_csv(@equipments_csv)
      end
    end

  end

  def create
    current_user.equipments.create!(equipment_params)
    lab_equipment_name = equipment_params[:lab_equipment_name]
    OperationHistory.create_log(current_user.id, lab_equipment_name, 0)
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
    lab_equipment_name = equipment.lab_equipment_name
    OperationHistory.create_log(current_user.id, lab_equipment_name, 1)
    redirect_to equipment
  end
  
  def destroy
    equipment = Equipment.find(params[:id])
    lab_equipment_name = equipment.lab_equipment_name
    OperationHistory.create_log(current_user.id, lab_equipment_name, 2)
    equipment.destroy!
    redirect_to root_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(
      :genre, 
      :lab_equipment_name, 
      :maker_name, 
      :product_name, 
      :purchase_year, 
      :asset_num, 
      :price, 
      :lendings_status, 
      :disposal_status, 
      :remarks)
  end

  def send_equipments_csv(equipments)
    csv_data = CSV.generate do |csv|
      column_names = %w(備品ジャンル 研究室用備品名 メーカー名 製品名 購入年度 資産番号 値段 備考 データ追加日 データ追加者)
      csv << column_names
      equipments.each do |equipment|
        column_values = [
          equipment.genre,
          equipment.lab_equipment_name,
          equipment.maker_name,
          equipment.product_name,
          equipment.purchase_year,
          equipment.asset_num,
          equipment.price,
          equipment.remarks,
          equipment.created_at,
          equipment.user.user_name
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "備品一覧.csv")
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    Equipment.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end


end
