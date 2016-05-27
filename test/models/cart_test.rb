require "test_helper"

class CartTest < MiniTest::Test
  
  def test_serializes_to_hash
    cart = Cart.new
    cart.add_item 1
    
    assert_equal cart.serialize, session_hash
  end
  
  def test_builds_from_hash
    cart = Cart.build_from_hash session_hash
    assert_equal 1, cart.items.first.product_id
  end
  
  private
  
  def session_hash
    {
      "cart" => {
        "items" => [
          { "product_id" => 1, "quantity" => 1 }
        ]
      }
    }
  end
end