require "test_helper"
class CategoryControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'News')
    @user = User.create(username: 'john',email:'john@example.com' ,password: 'password', admin: true )
  end
  test 'should get index' do
    get categories_path
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test 'should get show' do
    get category_path(@category)
    assert_response :success
  end


end