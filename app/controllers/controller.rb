class Controller
	def initialize(client)
		@client = client
	end

        def render(view_name)
		class_name = self.class.name
		class_name.gsub!(/Controller/, '').downcase!
                erb = ERB.new(File.read('../app/views/' + class_name + '/' + view_name + '.html.erb'))
                erb.run(binding)
        end
end
