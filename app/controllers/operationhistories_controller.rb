class OperationhistoriesController < ApplicationController
  def index
    @operation_histories = OperationHistory.all.includes(:user)
  end
end
