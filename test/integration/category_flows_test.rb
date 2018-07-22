require 'test_helper'

class CategoryFlowsTest < ActionDispatch::IntegrationTest


  test 'should get new and create category' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path , params: {category: {name: 'News'}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'News', response.body
  end

end
