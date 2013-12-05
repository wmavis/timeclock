class Model
	def initialize(attributes)
		attributes.each do |k,v|
			self.send("#{k}=", v)
		end
	end
end
