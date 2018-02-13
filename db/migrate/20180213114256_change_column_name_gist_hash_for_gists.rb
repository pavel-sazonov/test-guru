class ChangeColumnNameGistHashForGists < ActiveRecord::Migration[5.1]
  def change
    rename_column :gists, :gist_hash, :url
  end
end
