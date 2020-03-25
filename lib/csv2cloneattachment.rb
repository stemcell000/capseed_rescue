require 'csv'

data = CSV.read('uploads2/clone-attachments-2020-03-24B.csv', headers:true, col_sep:";")
data.each do |row|
	parent = Clone.find(row['Clone_id'])
	file = Dir['uploads2/clone_attachment/attachment/'+row['Id']+'/*']
	file_path = file[0]
	clone_attachment = CloneAttachment.new(attachment: Pathname.new(file_path).open)
	parent.clone_attachments << clone_attachment
	parent.save!
end



