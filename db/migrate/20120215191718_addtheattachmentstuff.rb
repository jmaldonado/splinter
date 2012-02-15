class Addtheattachmentstuff < ActiveRecord::Migration
  def change
    remove_column :attachments, :attach_content_type
    remove_column :attachments, :attach_file_name
    remove_column :attachments, :attach_file_size

    change_table :attachments do |t|
      t.has_attached_file :attach
    end

  end

  def down
  end
end
