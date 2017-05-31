class CreateMatchmakers < ActiveRecord::Migration[5.0]
  def change
    create_table :matchmakers do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
