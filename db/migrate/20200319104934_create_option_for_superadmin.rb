class CreateOptionForSuperadmin < ActiveRecord::Migration
  def up
    User.first.create_option
  end
  
  def down
    User.first.options.destroy_all
  end
end
