namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: 'Example User',
                  email: 'example@example.org',
                  password: 'foobar',
                  password_confirmation: 'foobar',
                  admin: true)

    99.times do |x|
      name = Faker::Name.name
      email = "example-#{x + 1}@example.org"
      password = 'password'
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
  end
end