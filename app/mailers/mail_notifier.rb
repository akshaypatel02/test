class MailNotifier < ApplicationMailer
  default from: 'Lead<no-reply@friendsNextDoor.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_notifier.received.subject
  #
  def received(email)
    @email = email

    mail to: email.email, subject: 'Welcome to Friends Next Door!' do |format|
      format.html
    end
  end
end
