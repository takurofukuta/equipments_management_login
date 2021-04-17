class LendingsHistoryController < ApplicationController
  def index
    @lendings = Lending.all.includes(:user, :equipment)
  end
end
