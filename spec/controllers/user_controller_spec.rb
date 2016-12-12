#we could not run these tests in our machine. There was installation problems with rspec. 
#Instead of pushing these test cases directly, we are commenting all of them for future reference.
=begin
  require 'test_helper'

  class RequestedUserTest < ActiveSupport::TestCase

  def setup
    @requesteduser = RequestedUser.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @requesteduser.valid?
  end
  
  test "name should be present" do
    @requesteduser.name = "     "
    assert_not @requesteduser.valid?
  end
  
  test "email should be present" do
    @requesteduser.email = "     "
    assert_not @requesteduser.valid?
  end
  
  test "name should not be too long" do
    @requesteduser.name = "a" * 51
    assert_not @requesteduser.valid?
  end

  test "email should not be too long" do
    @requesteduser.email = "a" * 50 + "@example.com"
    assert_not @requesteduser.valid?
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @requesteduser.email = invalid_address
      assert_not @requesteduser.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be unique" do
    duplicate_user = @requesteduser.dup
    duplicate_user.email = @requesteduser.email.upcase
    @requesteduser.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @requesteduser.email = mixed_case_email
    @requesteduser.save
    assert_equal mixed_case_email.downcase, @requesteduser.reload.email
  end
end

=end