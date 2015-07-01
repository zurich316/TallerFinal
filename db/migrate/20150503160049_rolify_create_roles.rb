#User migration for adding a Role to  Users modelable
class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |table|
      table.string :name
      table.references :resource, :polymorphic => true

      table.timestamps
    end

    create_table(:users_roles, :id => false) do |table|
      table.references :user
      table.references :role
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
