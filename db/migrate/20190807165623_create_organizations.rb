class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_reference :organizations, :user, foreign_key: true, default: 1, null: false
  end
end
