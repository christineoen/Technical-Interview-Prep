class Car
	attr_reader :color, :repaint_count
	def initialize(color)
		@color = color
		@repaint_count = 0
	end

	def paint(color)
		@repaint_count += 1
		@color = color
	end
end

c = Car.new("blue")
puts c.color #blue
puts c.repaint_count #0
c.paint("red")
c.paint("green")
puts c.repaint_count #2
puts c.color #green