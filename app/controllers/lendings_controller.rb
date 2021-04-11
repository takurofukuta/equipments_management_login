class LendingsController < ApplicationController
  def index
    @lendings = Lending.all
  end
end
