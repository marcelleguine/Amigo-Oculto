class UserMailer < ActionMailer::Base
  default :from => "amiguinhos.oculto@gmail.com"
  
  def invite_email(invitation, email)
    @user = invitation.user    
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "")
  end

end
