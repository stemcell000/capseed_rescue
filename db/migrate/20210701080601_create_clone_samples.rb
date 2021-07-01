class CreateCloneSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :clone_samples do |t|

      t.timestamps
    end
  end
end
