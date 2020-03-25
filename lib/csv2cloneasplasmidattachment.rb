require 'csv'

data = CSV.read('uploads2/clone-batch-as-plasmid-attachments-2020-03-24B.csv', headers:true, col_sep:";")
data.each do |row|
	parent = CloneBatch.find(row['Clone_batch_id'])
	file = Dir['uploads2/clone_batch_as_plasmid_attachment/attachment/'+row['Id']+'/*']
	file_path = file[0]
	clone_batch_as_plasmid_attachment = CloneBatchAsPlasmidAttachment.new(attachment: Pathname.new(file_path).open)
	parent.clone_batch_as_plasmid_attachments << clone_batch_as_plasmid_attachment
	parent.save!
end



