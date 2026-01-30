class ApplicationMailer < ActionMailer::Base
 ActionMailer::MailDeliveryJob.rescue_from(Exception) do |exception|
    Rails.error.report(exception)
    raise exception
  end
  default from: Rails.application.credentials.gmail[:username]
  layout "mailer"
end
