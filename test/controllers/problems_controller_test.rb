require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  setup do
    @problem = problems(:one)
    @user = users(:one)
  end

  context "request GET :new" do
    setup { get :new, nil, {current_user_id: @user.id}}
    should respond_with(:ok)
    should render_template('new')
  end

  context "request POST :create" do
    context "with invalid problem info" do
    setup {post :create, { problem: { user_id: @user.id, description: @problem.description, tried: "" } }, {current_user_id: @user.id}  }
      should "not save a problem" do
        assert assigns[:problem].invalid?
      end
      should render_template('new')
    end

    context "with valid problem info" do
      setup {post :create, { problem: { user_id: @user.id, description: @problem.description, tried: @problem.tried } }, {current_user_id: @user.id}  }
      should "save the problem" do
        assert assigns[:problem]
        assert assigns[:problem].persisted?
      end
      should "redirect to problem's show view" do
        assert_redirected_to problem_path(assigns(:problem))
      end
      should "send problems_posted email" do
      assert_not_empty ActionMailer::Base.deliveries
      #asserts any email was sent, not specifically problems_posted
      # binding.pry
      end
    end

  context "request GET :index" do
    setup { get :index, nil, {current_user_id: @user.id}}
    should respond_with(:ok)
    should render_template('index')
  end

  context "request GET :show" do
    setup { get :show, { id: problems(:one) }, {current_user_id: @user.id} }
    should respond_with(:ok)
    should render_template('show')
    # should render_template(partial: 'notes/new')
  end

  context "request PATCH :resolve" do
    setup { patch :resolve, { id: @problem}, {current_user_id: @user.id} }
    should "resolve the problem" do
      assert assigns[:problem].resolved
    end
    should "redirect to problems page" do
      assert_redirected_to root_path
    end
  end
 end
end