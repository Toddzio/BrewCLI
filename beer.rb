class Beer
	attr_accessor :name,:style, :description

	def initialize(name, style, description)
		@name = name
		@style = style
		@description = description
	end
end