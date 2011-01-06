module ApplicationHelper

    def title
        base_title = "gPanda"
        if @title.nil?
            base_title        
        else
            "#{base_title} : #{@title}"
        end
    end

end
