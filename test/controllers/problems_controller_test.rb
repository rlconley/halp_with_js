require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase

  setup do
    @problem = problems(:one)
  end

  context "request GET :new" do
    setup { get :new }
    should respond_with(:ok)
    should render_template('new')
  end

  context "request POST :create" do
    setup { post :create }
    should respond_with(:ok)

    context "with invalid problem info" do
      setup {post :create, {problem: {user_id: users(:one), description:"wat", tried: "" } } }
      should "not save a problem" do
        refute assigns[:problem]
      end
      should render_template('new')
    end

    context "with valid problem info" do
      setup {post :create, problem: { user_id: @problem.user_id, description: @problem.description, tried: @problem.tried } }
      should "save the problem" do
        assert assigns[:problem]
        assert assigns[:problem].persisted?
        assert_redirected_to problem_path(assigns(:problem))
      end
      # should_eventually "redirect to problem's show view" do
      #   assert_redirected_to problem_path(assigns(:problem))
      # end
      # # above is giving nil for assigns(:problem), but it works fine when bundled into the "save the problem" should
    end
  end

  context "request GET :index" do
    setup { get :index }
    should respond_with(:ok)
    should render_template('index')
  end

  context "request GET :show" do
    setup { get :show, { id: problems(:one) } }
    should respond_with(:ok)
    should render_template('show')
    should render_template(partial: 'comments/new')
  end

end
