# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'
end
