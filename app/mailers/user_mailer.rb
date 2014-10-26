class UserMailer < ActionMailer::Base
  default from: "noreply@halp.com"

  def problem_posted (user, problem)
    @user = user
    @problem = problem
    @url = "https://secret-cliffs-4141.herokuapp.com/problems/#{@problem.id}"
    mail to: @user.email, subject: "You've got a problem"
  end

  def note_added (user, problem)
    @user = user
    @problem = problem
    @url = "https://secret-cliffs-4141.herokuapp.com/problems/#{@problem.id}"
    mail to: @user.email, subject: "Note added on your problem"
  end
end
