class OperationhistoriesController < ApplicationController
  def index
    @operation_histories = OperationHistory.all
  end
end
