class LendingsController < ApplicationController
  def index
    # @lendings = Equipment.where(lendings_status: 1)
    @lendings = Lending.all
  end

  def update
    equipment = Equipment.find(params[:id])
    if equipment.lendings_status == 0
      equipment.lendings_status = 1
      Lending.create!(user_id: current_user.id, equipment_id: equipment.id)
      binding.pry
    elsif equipment.lendings_status == 1
      equipment.lendings_status = 0
    end
    equipment.save
    redirect_to root_path
  end
end
