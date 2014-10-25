require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def valid_user_attributes
    {name: Faker::Name.name,
     email: Faker::Internet.email,
     password: "password",
     password_confirmation: "password"}
  end

  def invalid_user_attributes
    {name: "",
     email: "",
     password: "",
     password_confirmation: ""}
  end



  context "request GET :new" do
    setup {get :new}

    should respond_with(:ok)
    should render_template(:new)

    should "instantiate a user object" do
      assert assigns[:user], "Should have a user"
    end
  end

  context "request POST :create" do
    context "when I send invalid info" do
      setup {post :create, user: invalid_user_attributes}

      should render_template(:new)

      should "instantiate an invalid user object" do
        assert assigns["user"], "Should have a user"
        assert assigns["user"].invalid?, "Should have an invalid user"
      end
    end
  end

end
