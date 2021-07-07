module SterilitytestsHelper
	def integer_to_sentence(val)
		case val
		when 1, "Sterile sample"
		when 2, "Contaminated sample"
		end
	end
end
