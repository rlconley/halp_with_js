# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Problem.delete_all
Note.delete_all

@users = []
15.times do
  password = Faker::Internet.password
  user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password,
      created_at: Faker::Time.between(60.days.ago, Time.now, :all)
  )
  @users << user
end

@problems = []
@users.each do |u|
  rand(1..5).times do
    problem = Problem.create(
        description: ["How do I even ", "Why can't I " ].sample + Faker::Company.bs + "?",
        tried: "I tried " + Faker::Hacker.verb + "ing the " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + ", like 17 times.",
        user_id: u.id,
        created_at: Faker::Time.between(u.created_at, Time.now, :all),
        resolved: [true, false].sample
    )
    @problems << problem
  end
end

@notes = []
@problems.each do |p|
  rand(0..5).times do
    note = Note.create!(
        text: [["Obviously you didn't ", "Duh, just ", "Don't forget to "].sample + Faker::Company.bs + ".", "I got nothin'.", "It's all greek to me.  Or Latin, whatever."].sample,
        user_id: @users.sample.id,
        problem_id: p.id,
        created_at: Faker::Time.between(p.created_at, Time.now, :all)
    )
  end
end
