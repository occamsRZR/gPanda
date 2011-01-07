module ApplicationHelper

    def logo
        logo = image_tag("panda.jpg", :alt => "Punk Pandas", :class => "round") 
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
