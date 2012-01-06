# coding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "amiguinhos.oculto@gmail.com"
  
  def invite_email(invitation, email)
    @group = invitation.group
    @user = invitation.user    
    @url  = "http://localhost:3000#{accept_group_path(@group.id, invitation.code)}"
    @invitation = invitation
    mail(:to => email, :subject => "Você foi convidado para #{@group.name}") do |format|
      format.html
    end
  end

end
