require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/users/new'
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post '/users', params: { user: { name: "John Doe", email: "po@g.com", age: 25, password: "password" } }

      assert_redirected_to "/users/#{User.last.id}"
    end
  end

  test "should display all users" do
    get '/users'

    assert_equal User.all, assigns(:users)
    assert_response :success
  end

  test "should display user" do
    user = User.new(name: "John Doe", email: "johndoe@email.com", password: "password", age: 25)
    user.save!

    get "/users/#{user.id}"

    assert_equal User.find(user.id), assigns(:user)
    assert_response :success
  end

  test "should get edit" do
    user = User.new(name: "John Doe", email: "johndoe@email.com", password: "password", age: 25)
    user.save!

    get "/users/#{user.id}/edit"

    assert_equal User.find(user.id), assigns(:user)
    assert_response :success
  end

  test "should update user" do
    user = User.new(name: "John Doe", email: "johndoe@email.com", password: "password", age: 25)
    user.save!

    patch "/users/#{user.id}", params: { user: { age: 30} }

    assert_equal 30, User.find(user.id).age
    assert_redirected_to "/users/#{user.id}"
  end

  test "should destroy user" do
    user = User.new(name: "John Doe", email: "johndoe@email.com", password: "password", age: 25)
    user.save!

    assert_difference("User.count", -1) do
      delete "/users/#{user.id}"
    end

    assert_redirected_to "/users"
  end
end
