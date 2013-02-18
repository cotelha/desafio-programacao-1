require 'csv'
class UploadAndImportSalesToDb

	def initialize(file)		
		@file = file
		@file_content_type = file.content_type unless @file.blank?
	end

	def verfy_content_file?
		@file_content_type == "application/octet-stream"
	end	

	def valid?
		!@file.blank? and verfy_content_file?
	end		

	def parser_file
		CSV.parse(File.open('import', 'r') { |f| @file.read }.force_encoding("UTF-8"), col_sep: "\t" ) 
	end

	def verify_count_columns?
		true
	end

	def import_to_db
		if valid? and verify_count_columns? then
			txt = parser_file
			txt.delete_at(0) # delete header									
			txt.each do |c|
				Sale.create(
				:purchaser_name=>c[0],
				:item_description=>c[1],
				:item_price=>c[2],
				:purchase_count=>c[3],
				:merchant_address=>c[4],
				:merchant_name=>c[5]
				)
			end
			true
		else
			false
		end
	end

end