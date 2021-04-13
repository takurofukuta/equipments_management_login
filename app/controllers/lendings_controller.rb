class LendingsController < ApplicationController
  def index
    @lendings = Lending.all
  end

  def update
    equipment = Equipment.find(params[:id])
  end
end
