class UserMailer < ActionMailer::Base
  default :from => "Unmute <hi@unmute.co>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.post_favorited.subject
  #
  def post_favorited(user)
    @user = user

    mail to: user.email, 
  end

  def new_post(user)
    @user = user
    # email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = 'http://unmute.co'
    mail to: "jgvandehey@gmail.com", subject: 'A new post was added to Unmute'
  end
end
