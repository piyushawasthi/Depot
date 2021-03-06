require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Store Order Confirmation", mail.subject
    assert_equal ["piyush.awasthi@anchanto.com"], mail.to
    assert_equal ["awasthi.piyush8@gmail.com"], mail.from
    assert_match /1 x Ruby/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Store Order Shipped", mail.subject
    assert_equal ["piyush.awasthi@anchanto.com"], mail.to
    assert_equal ["awasthi.piyush8@gmail.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td> Ruby<\/td>/, mail.body.encoded
  end

end
