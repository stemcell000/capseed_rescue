require 'csv'

data = CSV.read('uploads2/plasmid-batch-attachments-2020-03-24B.csv', headers:true, col_sep:";")
data.each do |row|
	parent = PlasmidBatch.find(row['Plasmid_batch_id'])
	file = Dir['uploads2/plasmid_batch_attachment/attachment/'+row['Id']+'/*']
	file_path = file[0]
	pb_attachment = PlasmidBatchAttachment.new(attachment: Pathname.new(file_path).open)
	parent.plasmid_batch_attachments << pb_attachment
	parent.save!
end



