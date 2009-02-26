class CreateInitialModel < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
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
  end
end
