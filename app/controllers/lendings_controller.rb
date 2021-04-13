class LendingsController < ApplicationController
  def index
    @lendings = Equipment.where(lendings_status: 1)
  end

  def update
    equipment = Equipment.find(params[:id])
    if equipment.lendings_status == 0
      equipment.lendings_status = 1
    elsif equipment.lendings_status == 1
      equipment.lendings_status = 0
    end
    equipment.save
    redirect_to root_path
  end
end