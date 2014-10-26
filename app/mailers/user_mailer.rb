class UserMailer < ActionMailer::Base
  default from: "noreply@halp.com"

  def problem_posted (user, problem)
    @user = user
    @problem = problem
    @url = 'https://secret-cliffs-4141.herokuapp.com/problems'
    mail to: @user.email, subject: "You've got a problem"
  end

end
