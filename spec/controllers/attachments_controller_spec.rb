require 'spec_helper'

describe AttachmentsController do

  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    describe "success" do

      before(:each) do
        @attr = { :recipient_name => "New User",
           :recipient_email => "user@example.com",
           :sender_name => "New User",
           :sender_email => "user@example.net",
           :attach_file_size => '1234',
           :attach_updated_at => Time.now,
           :attach_file_name => "4573593350_6d658c6056_b.jpg",
           :attach_content_type => "image/jpeg",
           :message => "Oh hello",
           :salt => Digest::SHA2.hexdigest("Crap"),
           :file_id => Digest::SHA2.hexdigest("More crap")
      }
      end

      it "should create a record" do
        lambda do
          post :create, :attachments => @attr
        end.should change(Attachment, :count).by(1)
      end

    end

  end

end
