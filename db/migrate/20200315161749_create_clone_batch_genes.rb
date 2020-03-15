class CreateCloneBatchGenes < ActiveRecord::Migration
  def up
  create_table "clone_batches_genes", force: :cascade do |t|
    t.integer "clone_batch_id"
    t.integer "gene_id"
  end
  end
  
  def down
    drop_table :clone_batches_genes
  end
end
