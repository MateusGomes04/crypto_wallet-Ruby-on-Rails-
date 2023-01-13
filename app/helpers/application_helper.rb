module ApplicationHelper

        def locale(locale)
            if I18n.locale == :en
                "American English"
            else
                "Português do Brasil"
            end  
        end             
    
        def data_br(data_us)
    
            data_us.strftime("%d/%m/%Y")
        end
    
    def ambiente_rails
        if Rails.env.development?
            "Development"
        elsif Rails.env.production?
            "production"
        else
            "test"
        end
    end
end
