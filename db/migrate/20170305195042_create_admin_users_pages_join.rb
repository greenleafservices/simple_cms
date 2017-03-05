class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.0]

  def up
    create_table :admin_users_pages, :id => false do |t| # ==> don't create an auto index
      t.integer "admin_user_id" #foreign key for the admin_user table - singular
      t.integer "page_id" #foreign key for the page table - singular
    end
    # index for this table (2 elements in an array)
    add_index("admin_users_pages", ["admin_user_id", "page_id"])
  end

  def down
    drop_table :admin_users_pages
  end

end
