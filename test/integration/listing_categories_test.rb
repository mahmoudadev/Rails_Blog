require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Books")
  end

  test 'show listing categories' do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end



end