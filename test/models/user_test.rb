require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
   end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

test "email validation should accept valid addresses" do
 	valid_addresses = %w[james@yahoo.com JAMES@yahoo.COM J_A-MES@yah.co.org james.tang@foo.jp james+tang@baz.cn]
 	valid_addresses.each do |valid_address|
 		@user.email = valid_address
 		assert @user.valid?, "#{valid_address.inspect} should be valid"
 	end
end

test "email validation should reject invalid addresses" do
 	invalid_addresses = %w[james@yahoo,com JAMES@yahoo+gmail.com J_A-MES_yah.co.org james.tang@foo. james@baz_cn..com]
 	invalid_addresses.each do |invalid_address|
 		@user.email = invalid_address
 		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
 	end
end

test "email address should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
end

end