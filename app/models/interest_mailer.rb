class InterestMailer < ActionMailer::Base
  def new_call_notification(call, emails)
    recipients emails
    from 'your open call awaits. <mailer@myopencall.com>'
    subject call.name
    sent_on Time.now
    body :call => call
  end
end