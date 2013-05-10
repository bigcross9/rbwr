class ReadFile
	def content()
		file = File.new("README", "r")
		i=0
		vec = [1000]
		while (line = file.gets)
			vec[i]=line
			i=i+1
		end
		return vec[0].strip
		file.close
	end
end