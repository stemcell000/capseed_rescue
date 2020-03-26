require 'csv'

data = CSV.read('uploads2/qc-attachments-2020-03-24B.csv', headers:true, col_sep:";")
data.each do |row|
	file = Dir['uploads2/qc_attachment/attachment/'+row['Id']+'/*']
	file_path = file[0]
	unless file_path.nil?
		qc_attachment = QcAttachment.new(attachment: Pathname.new(file_path).open)
		qc_attachment.save!(validate: false)
	end
end



