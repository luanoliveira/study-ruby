class Ui
    attr_accessor :page_title, :page_subtitle

    def initialize
        puts "Initialize Ui"
    end
end

ui = Ui.new
ui.page_title = 'My App'
puts ui.page_title