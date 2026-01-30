class UserMailer < ApplicationMailer
  before_action :log_before
  after_action  :log_after
  prepend_view_path Rails.root.join("app", "views", "custom_mailer")

  def welcome_email(user)
    @user = user
    @greeting = "Hello There #{user.name}"

    attachments.inline["Rails-logo.jpg"] = File.read(
      Rails.root.join("public", "attachments", "Rails-logo.jpg")
    )

    mail(
      to: @user.email,
      subject: "Welcome to our app"
    )
  end

  def account_report(user)
    @user = user
  
    attachments["file1.pdf"] = File.read(
      Rails.root.join("public", "attachments", "file1.pdf")
    )

    attachments["data.txt"] = File.read(
      Rails.root.join("public", "attachments", "data.txt")
    )

    attachments.inline["Rails-logo.jpg"] = File.read(
      Rails.root.join("public", "attachments", "Rails-logo.jpg")
    )

    mail(
      to: [@user.email, "admin@example.com"],
      subject: I18n.t("mailer.subjects.account_report")
    )
  end

  private

  def log_before
    Rails.logger.info "Preparing mail for #{@user&.email}"
  end

  def log_after
    Rails.logger.info "Mail prepared"
  end
end
