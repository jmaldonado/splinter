class Attachment < ActiveRecord::Base

  require 'open-uri'

  attr_accessor :attach, :remove_old_records, :file_id

  attr_accessible :attach, :sender_name, :sender_email, :recipient_name, :recipient_email, :message, :attach_file_name

  has_attached_file :attach,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_permissions => :public_read,
    :path => "splinter/:id/original/:basename.:extension"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_attachment_presence :attach

  validates :attach_file_name, :presence => { :message => "You did not enter a file to upload" }

  validates :recipient_email,
    :presence => true, 
    :length => { :within => 5..50, :message => " - The recipient email address is too long/not long enough" },
    :format => { :with => email_regex, :message => " - The recipient email address is not correctly entered" }

  validates :sender_email,
    :presence => true, 
    :length => { :within => 5..50, :message => " - Your email address is too long/not long enough" },
    :format => { :with => email_regex, :message => " - Your email address is not correctly entered" }

  validates :recipient_name, :sender_name,
    :presence => true,
    :length => { :within => 1..70 }

  def self.remove_old_records
    Attachment.delete_all(["created_at < ?", 3.days.ago])
  end

  before_create :generate_hidden_stuff

  def generate_hidden_stuff
    self.file_id = Digest::SHA2.hexdigest(attach_file_name)
  end


end


