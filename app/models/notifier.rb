class Notifier < ActionMailer::Base
  default_url_options[:host] = "totsy.com"
  
  def password_reset_instructions(user)
    subject       "get back to your open calls"
    from          "your open calls <mailer@myopencall.com>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
  
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "Totsy.com <support@totsy.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => "http://www.totsy.com/activate/#{user.id}/#{user.perishable_token}"
  end

  def activation_confirmation(user)
    subject       "Welcome to Totsy!"
    from          "Audrey & Nicole of Totsy <nicole@totsy.com>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => root_url, :name => user.first_name, :account_url => customer_url(user)
  end
end