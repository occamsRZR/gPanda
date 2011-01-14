module ApplicationHelper

    def logo
        image_tag("gpanda.png", :alt => "gpanda", :class => "round") 
    end
    
    def title
        base_title = "gPanda"
        if @title.nil?
            base_title        
        else
            "#{base_title} : #{@title}"
        end
    end

end
