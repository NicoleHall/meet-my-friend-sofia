class AddColumnsToDaterProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :dater_profiles, :name, :string
    add_column :dater_profiles, :age, :integer
    add_column :dater_profiles, :zipcode, :integer
    add_column :dater_profiles, :gender, :integer
    add_column :dater_profiles, :kids, :integer
    add_column :dater_profiles, :interested_in_men, :boolean
    add_column :dater_profiles, :interested_in_women, :boolean
    add_column :dater_profiles, :interested_in_any, :boolean
  end
end
