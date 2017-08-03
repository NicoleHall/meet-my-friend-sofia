class CreateDaterProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :dater_profiles do |t|
      t.references :matchmaker, foreign_key: true

      t.timestamps
    end
  end
end
