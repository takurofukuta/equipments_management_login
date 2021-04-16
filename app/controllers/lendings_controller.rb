class LendingsController < ApplicationController
  def index
    # @lendings = Equipment.where(lendings_status: 1)
    @lendings = Lending.where(lendings_status: 1)
  end

  def update
    #貸出・返却ボタンを押した時の処理

    equipment = Equipment.find(params[:id])

    #備品一覧ページの貸出ボタンを押した時の処理
    if equipment.lendings_status == 0
      equipment.lendings_status = 1
      Lending.create!(user_id: current_user.id, equipment_id: equipment.id, lendings_status: 1)
      equipment.save
      redirect_to root_path

      #貸出状況ページの返却ボタンを押した時の処理
    elsif equipment.lendings_status == 1
      lending = Lending.find(params[:id])
      equipment.lendings_status = 0
      lending.lendings_status = 0
      equipment.save
      lending.save
      redirect_to lendings_path
    end
  end
end
