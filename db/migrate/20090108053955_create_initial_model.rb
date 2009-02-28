class CreateInitialModel < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
	  t.column :user_type,                 :string
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :statement,                 :text, :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime
      t.column :password_reset_code,       :string, :limit => 40
      t.column :enabled,                   :boolean, :default => true
      t.column :identity_url,              :string
      t.timestamps
    end
    add_index :users, :login, :unique => true

    create_table :roles do |t|
      t.string :name
      t.timestamps
    end

    # generate the join table
    create_table :roles_users, :id => false do |t|
      t.integer :role_id, :user_id
      t.timestamps
    end
    add_index :roles_users, :role_id
    add_index :roles_users, :user_id

    create_table :logged_exceptions, :force => true do |t|
      t.column :exception_class, :string
      t.column :controller_name, :string
      t.column :action_name,     :string
      t.column :message,         :text
      t.column :backtrace,       :text
      t.column :environment,     :text
      t.column :request,         :text
      t.timestamps
    end

    create_table :four_oh_fours do |t|
      t.string :url, :referer
      t.integer :count, :default => 0
      t.timestamps
    end

    add_index :four_oh_fours, [:url, :referer], :unique => true
    add_index :four_oh_fours, [:url]

    create_table :user_failures do |t|
      t.string :remote_ip, :http_user_agent, :failure_type, :username
      t.integer :count, :default => 0
      t.timestamps
    end

    add_index :user_failures, :remote_ip

    create_table :photos do |t|
      t.column :photographed_id, :integer # generic photographed_id
      t.column :photographed_type, :string # holds the class
      
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.timestamps
    end

    create_table :beneficiaries do |t|
      t.string   :name_first
      t.string   :name_middle
      t.string   :name_last
      t.text     :statement
      t.timestamps
    end
  
    create_table :organizations do |t|
      t.string   :name
      t.string   :phone
      t.string   :web_site_url
      t.text     :description
      t.timestamps
    end
    
    create_table :groups do |t|
      t.string :name
      t.integer :organization_id
      t.timestamps
    end
    
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :beneficiary_id
      t.timestamps
    end
    
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :addressable_id
      t.string :addressable_type
      t.timestamps
    end
    
    create_table :pledges do |t|
      t.integer :organization_id
      t.timestamps
    end
    
    create_table :pledge_line_items do |t|
      t.decimal :amount
      t.integer :pledge_id
      t.string :description
      t.timestamps
    end

    add_column(:pledges, :user_id, :integer)

    #Be sure to change these settings for your initial admin user
    user = SiteUser.new
    user.login = "admin"
    user.email = APP_CONFIG['settings']['admin_email']
    user.password = "password"
    user.password_confirmation = "password"
    user.save
    role = Role.new
    #Admin role name should be "admin" for convenience
    role.name = "admin"
    role.save
    admin_user = SiteUser.find_by_login("admin")
    admin_role = Role.find_by_name("admin")
    admin_user.activated_at = Time.now.utc
    admin_user.roles << admin_role
    admin_user.save
  end

  def self.down
    admin_user = User.find_by_login("admin")
    admin_role = Role.find_by_name("admin")
    admin_user.roles = []
    admin_user.save
    admin_user.destroy
    admin_role.destroy

    remove_column(:pledges, :user_id)
    drop_table :pledge_line_items
    drop_table :pledges
    drop_table :addresses
    drop_table :group_members
    drop_table :groups
    drop_table :organizations
    drop_table :gender_options
    drop_table :beneficiaries
    drop_table :photos
    drop_table :user_failures
    drop_table :four_oh_fours
    drop_table :logged_exceptions
    drop_table :roles
    drop_table :roles_users
    drop_table :users
  end
end
