class AttachmentsMailer < ActionMailer::Base
  default :from => "juan.maldonado@gmail.com"

  def attachment_confirmation(attachment)
    @attachment = attachment
    mail(:to => attachment.recip_email, :subject => "You have an attachment waiting")
  end
end
