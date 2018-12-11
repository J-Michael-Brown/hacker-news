class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column :username, :string

      t.timestamps
    end

    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :article_id, :integer
      t.column :content, :text

      t.timestamps
    end

    create_table :articles do |t|
      t.column :user_id, :integer
      t.column :link, :string
      t.column :title, :string
      t.column :points, :integer

      t.timestamps
    end
  end
end
