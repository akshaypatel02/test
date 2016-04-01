# Preview all emails at http://localhost:3000/rails/mailers/mail_notifier
class MailNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_notifier/received
  def received
    MailNotifier.received
  end

end
