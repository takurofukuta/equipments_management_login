require "test_helper"

class OperationhistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get operationhistories_index_url
    assert_response :success
  end
end
