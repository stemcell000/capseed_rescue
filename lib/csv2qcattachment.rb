require 'csv'

data = CSV.read('uploads2/qc-attachments-2020-03-24B.csv', headers:true, col_sep:";")
data.each do |row|
	parent = QcAcctachment.find(row['Id'])
	file = Dir['uploads2/qc_attachment/attachment/'+row['Id']+'/*']
	file_path = file[0]
	qc_attachment = QcAttachment.new(attachment: Pathname.new(file_path).open)
	qc_attachment.save!
end



