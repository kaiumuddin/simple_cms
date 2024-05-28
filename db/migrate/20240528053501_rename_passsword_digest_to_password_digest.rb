class RenamePassswordDigestToPasswordDigest < ActiveRecord::Migration[7.1]
  def change
    rename_column :admin_users, :passsword_digest, :password_digest
  end
end
