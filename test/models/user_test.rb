require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Example", last_name:  "User", email: "user@example.com", password: "jamestang", password_confirmation: "jamestang")
  end

  test "should be valid" do
    assert @user.valid?, "everything good"
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
    @user.fullname = "a" * 51
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
 	invalid_addresses = %w[jams@yahoo,com JAMES@yahoo+gmail.com J_A-MES_yah.co.org james.tang@foo. james@baz_cn..com]
 	invalid_addresses.each do |invalid_address|
 		@user.email = invalid_address
 		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
 	end
end

test "email address should be unique" do
  duplicate_user = @user.dup
  duplicate_user.email = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
end

test "email address must be lowercase" do
  mixed_case_email = "Jame@yAho.COM"
  @user.email = mixed_case_email
  @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
end

test "password should not be blank" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
end

test "password shoudl have minimum length" do
  @user.password = @user.password_confirmation = "a" *5
  assert_not @user.valid?
end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { first_name:  "Example",
                                            last_name: "User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
  end



end
