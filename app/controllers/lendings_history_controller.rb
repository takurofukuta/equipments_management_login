class LendingsHistoryController < ApplicationController
  def index
    @lendings = Lending.all
  end
end
