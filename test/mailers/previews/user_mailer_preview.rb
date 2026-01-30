# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def welcome_email
    user = User.first || User.new(name: "Preview User", email: "test@example.com")
    UserMailer.welcome_email(user)
    end
end
