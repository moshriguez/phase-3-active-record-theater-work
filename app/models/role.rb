class Role < ActiveRecord::Base

    has_many :auditions

    def actors
        self.auditions.map {|audition| audition.actor }
    end

    def locations
        self.auditions.map {|audition| audition.location }
    end

    def lead
        l = self.auditions.find {|audition| audition.hired == true }
        if l == nil
            return "no actor has been hired for this role"
        else
            return l
        end
    end

    def understudy
        l = self.auditions.select {|audition| audition.hired == true }
        if l == nil
            return "no actor has been hired for this role"
        else
            return l[1]
        end
    end
    
end