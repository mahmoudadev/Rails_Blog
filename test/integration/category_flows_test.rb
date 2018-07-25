require 'test_helper'

class CategoryFlowsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'john',email:'john@example.com' ,password: 'password', admin: true )
  end

  test 'should get new and create category' do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path , params: {category: {name: 'News'}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'News', response.body
  end

  test 'invalid category submission results and failure' do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path , params: {category: {name: ' '}}
    end
    assert_template 'categories/new'
    assert_select "div.alert-danger"
  end



end
