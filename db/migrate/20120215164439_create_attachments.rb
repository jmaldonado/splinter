class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :recipient_name
      t.string :recipient_email
      t.text :message
      t.string :file_id
      t.string :attach_content_type
      t.string :attach_file_name
      t.integer :attach_file_size

      t.timestamps
    end
  end
end
