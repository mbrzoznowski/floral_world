require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test 'index should show all Products' do
    get products_path


    assert_response :success
  end


end