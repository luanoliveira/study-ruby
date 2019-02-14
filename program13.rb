module Admin
    module Ui
        def version
            '1.0'
        end
    end

    module Test
        def hello
            2*5
        end
    end
end

class App
    include Admin::Ui
    extend Admin::Test
end

app = App.new
puts app.version
puts App.hello