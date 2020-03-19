class AddAdministrator < ActiveRecord::Migration
  def up    
         User.create! do |u|
          u.email     = 'marc.lechuga@inserm.fr'
          u.username = 'mlechuga'
          u.firstname = 'Marc'
          u.lastname = 'Lechuga'
          u.encrypted_password   = 'stemcell'
          u.password = 'stemcell'
          u.password_confirmation = 'stemcell'
          u.role = 'administrator'
         end
  end
  def down
  end
end
