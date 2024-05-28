class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column 'admin_users', 'hashed_password'
    add_column 'admin_users', 'passsword_digest', :string
  end

  def down
    remove_column 'admin_users', 'passsword_digest'
    add_column 'admin_users', 'hashed_password', :string, limit: 40
  end
end
