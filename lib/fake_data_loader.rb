# Put, inside the load method, the necessary code to generate data with DEVELOPMENT PURPOSES.
# Whenever you can, use FactoryBot's methods to keep this code "self updated".
#
# For Example:
#
# Having a country factory in /spec/factories/countries.rb
#
# FactoryBot.define do
#   factory :country do
#     name "Chile"
#     locale "es-CL"
#     currency "$CLP"
#   end
# end
#
# Choose to do this:
#
# create(:country)
#
# Instead of this:
#
# Country.create(name: "Chile", locale: "es-CL", currency: "$CLP")
#

Faker::Config.locale = I18n.locale

module FakeDataLoader
  extend FactoryBot::Syntax::Methods

  USER_PASSWORD = 12345678

  def self.load
    load_admin
    load_users
    load_sessions
  end

  def self.load_admin
    email = "admin@example.com"
    pass = "password"
    admin = AdminUser.find_by(email: email)
    AdminUser.create!(email: email, password: pass, password_confirmation: pass) unless admin
  end

  def self.load_users
    10.times do
      user = create(
        :user,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: USER_PASSWORD
      )

      puts "user: #{user.email} - password: #{USER_PASSWORD}"
    end
  end

  def self.load_sessions
    User.all.each do |user|
      rand(5..10).times do
        create(
          :feedback_session,
          provider: user,
          receiver: User.where.not(id: user.id).sample
        )
      end
    end
  end
end
