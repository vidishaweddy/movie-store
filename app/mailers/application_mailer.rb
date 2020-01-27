class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@moviestore.com'
  layout 'mailer'
end
