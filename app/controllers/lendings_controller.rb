class LendingsController < ApplicationController
  def index
    @lendings = Lending.includes(:user, :equipment).where(lendings_status: 1)
  end

  #備品一覧ページの貸出ボタンを押した時の処理
  def lending
    equipment = Equipment.find(params[:id])
    equipment.lendings_status = 1
    equipment.save

    Lending.create!(user_id: current_user.id, equipment_id: equipment.id, lendings_status: 1)
    redirect_to root_path
  end

  #貸出状況ページの返却ボタンを押した時の処理
  def return
    lending = Lending.find(params[:id])
    lending.lendings_status = 0
    lending.save

    equipment = Equipment.find(lending.equipment_id)
    equipment.lendings_status = 0
    equipment.save

    redirect_to lendings_path
  end
end
