require './test/test_helper'

class MinipostTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: 'example@gmail.com', username: 'Michael', bio: '', password: 'password')
    @user.save
    @minipost = @user.miniposts.build(content: "This is Test for miniposts!")
  end

  test "should be valid" do
    assert @minipost.valid?
  end

  test "user id should be present" do
    @minipost.user_id = nil
    assert_not @minipost.valid?
  end

  test "content should be present" do
    @minipost.content = "   "
    assert_not @minipost.valid?
  end

  test "content should be less than 140 characters" do
    @minipost.content = "a" * 141
    assert_not @minipost.valid?
  end

  # test "should retrive latests posts first" do
  #   assert_equal miniposts(:most_recent), Minipost.first
  # end

  test "user associated miniposts should be destroyed" do
    @user = User.new(username: "example", email: "user@example.com",
                     password: "password", password_confirmation: "password")
    @user.save
    @user.miniposts.create!(content: "This is a test post inside another test!")
    assert_difference 'Minipost.count', -1 do
    @user.destroy
    end
  end
end
