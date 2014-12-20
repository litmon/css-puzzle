class RenameTokenSecretToAuthentications < ActiveRecord::Migration
  def change
    rename_column :authentications, :token_secret, :secret
  end
end
