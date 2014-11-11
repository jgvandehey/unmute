require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "post_favorited" do
    mail = UserMailer.post_favorited
    assert_equal "Post favorited", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
