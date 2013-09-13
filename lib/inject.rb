class Array
    def inject (sum = nil)
        sum ||= self.shift
        self.each { |element| sum = yield(sum, element) }
        sum
    end
end
