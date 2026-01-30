class Greeting 
    def render_in(view_context)
            view_context.render plain: "Hello Good Afternoon How are you!!..."
    end

    def format 
       :text
    end
end
