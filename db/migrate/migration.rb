ActiveRecord::Schema.define(:version => 20120215235613) do

  create_table "attachments", :force => true do |t|
    t.string   "sender_name"
    t.string   "sender_email"
    t.string   "recipient_name"
    t.string   "recipient_email"
    t.text     "message"
    t.string   "file_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.string   "attach_file_name"
    t.datetime "attach_updated_at"
  end

end