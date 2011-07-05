class UserMailer < ActionMailer::Base
  default APP_CONFIG["mailer_default"]#:from => APP_CONFIG["mailer_from"], :to => APP_CONFIG["enquiry_notification_email"]
  def submit_enquiry(enquiry)
    @enquiry = enquiry
    mail(:subject => "new enquiry from #{enquiry.name}")
  end
end
