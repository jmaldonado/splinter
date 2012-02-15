class Ihatethis < ActiveRecord::Migration
  def up
    add_column(:attachments, :salt, :string)
  end

  def down
  end
end


