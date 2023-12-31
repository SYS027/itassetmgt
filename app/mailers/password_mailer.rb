class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @admin= params [:admin]
    @reset_password_token = params [:admin].signed_id(purpose: "password_reset")
    mail to: @admin.email
  end
end
