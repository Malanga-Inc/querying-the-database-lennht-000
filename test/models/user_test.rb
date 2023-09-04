require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should be valid with all attributes" do
    user = User.new(name: "John Doe", email: "john@example.com", age: 25, password: "password")
    assert user.valid?
  end

  test "should require name" do
    user = User.new(email: "john@example.com", age: 25, password: "password")
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"
  end

  test "should require email" do
    user = User.new(name: "John Doe", age: 25, password: "password")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should require age" do
    user = User.new(name: "John Doe", email: "email@email.com", password: "password")
    assert_not user.valid?
    assert_includes user.errors[:age], "is not a number"
  end

  test "should require age to be a positive integer" do
    user = User.new(name: "John Doe", email: "john@example.com", age: -5, password: "password")
    assert_not user.valid?
    assert_includes user.errors[:age], "must be greater than 0"
  end

  test "should capitalize name before saving" do
    user = User.new(name: "john doe", email: "john@example.com", age: 25, password: "password")
    user.save
    assert_equal "John doe", user.name
  end
end
