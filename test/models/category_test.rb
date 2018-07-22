require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "Category shoub be exist" do
    assert @category.valid?
  end

  test 'category name shoud be present' do
    @category.name = " "
    assert_not @category.valid?
  end

  test 'category name should be unique' do
    @category.save
    @cat2 = Category.new(name: "Sports")
    assert_not @cat2.valid?
  end

  test 'category name should not be too long' do
    @category.name = "a" * 60
    assert_not @category.valid?
  end

  test 'category name should not be too short' do
    @category.name = 'a'
    assert_not @category.valid?
  end

end