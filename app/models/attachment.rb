class Attachment < ActiveRecord::Base

  attr_accessor :splints, :encrypt_attachment, :remove_old_records, :salt, :file_id

  attr_accessible :splints, :sender_name, :sender_email, :recip_name, :recip_email, :message

  require 'open-uri'
  has_attached_file :splints,
    :path => "splints/:id/original/:basename.:extension",
    :storage => :s3,
    :bucket => 'storefrontlesbianism',
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_permissions => 'public'

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_attachment_presence :splints

  validates :splints_file_name, :presence => { :message => "You did not enter a file to upload" }

  validates :recip_email,
    :presence => true, 
    :length => { :within => 5..50, :message => " - The recipient email address is too long/not long enough" },
    :format => { :with => email_regex, :message => " - The recipient email address is not correctly entered" }

  validates :sender_email,
    :presence => true, 
    :length => { :within => 5..50, :message => " - Your email address is too long/not long enough" },
    :format => { :with => email_regex, :message => " - Your email address is not correctly entered" }

  validates :recip_name, :sender_name,
    :presence => true,
    :length => { :within => 1..70 }

    def self.remove_old_records
      Attachment.delete_all(["created_at < ?", 3.days.ago])
    end

  before_save :encrypt_attachment

  private

    def encrypt_attachment
      self.salt = make_salt if new_record?
      self.file_id = salt
      # self.file_id = encrypt(splints_file_name)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{splints_file_name}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end


