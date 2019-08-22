class AddSubdomainToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :subdomain, :string, default: "master", null: false
  end
end
