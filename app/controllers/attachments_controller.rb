class AttachmentsController < ApplicationController

  def new
    @title = "Upload an attachment"
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.create(params[:attachments])
    if @attachment.save
      @title = "Attachment has been uploaded"
      AttachmentsMailer.attachment_confirmation(@attachment).deliver
    else
      @title = "Upload an attachment"
      render 'new'
    end
  end

  def show
    @attachment = Attachment.find_by_file_id(params[:file_id])
    if @attachment.nil?
      @title = "This file does not exist"
    else
      @title = "Download #{@attachment.attach_file_name}"
    end
  end

  def get
    download = Attachment.find_by_file_id(params[:file_id])
    if download
      data = open(download.attach.url).read
      send_data data, :filename => download.attach_file_name
    else
      redirect_to root_path
    end
  end

end


