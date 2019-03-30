class ApplicationMailer < ActionMailer::Base
  default from: "techforseniors17@gmail.com"

  def contact_email(params)
    @params = params
    mail(to: 'techforseniors17@gmail.com', subject: 'Contact Us Email')
  end
end
