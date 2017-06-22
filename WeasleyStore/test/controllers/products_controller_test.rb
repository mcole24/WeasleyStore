require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { images: @product.images, galleons: @product.galleons, product_name: @product.product_name, weight: @product.weight, quantity: @product.quantity } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { images: @product.images, galleons: @product.galleons, product_name: @product.product_name, weight: @product.weight, description: @product.description, quantity: @product.quantity } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "should show galleon as integer" do
    assert_equal true, @product.galleons.is_a?(Numeric)
    assert_equal false, @product.galleons.is_a?(String)
  end

  test "should show weight as decimal" do
    assert_equal true, @product.weight.is_a?(Numeric)
    assert_equal false, @product.weight.is_a?(String)
  end

  test "should show quantity as integer" do
    assert_equal true, @product.quantity.is_a?(Numeric)
    assert_equal false, @product.quantity.is_a?(String)
  end

end
