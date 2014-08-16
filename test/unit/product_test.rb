require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end

  test "products is not valid without a unique title" do
    product = Product.new(title: products(:ruby).title,
                          description: "yyy",
                          price: 1,
                          image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.message.taken')], Product.errors["title]
  end

end
