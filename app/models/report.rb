class Report < ActiveRecord::Base
    def self.check_and_create(report_params) 
        if Report.where(building: report_params[:building], area: report_params[:area]).take.nil?
            report_params[:status] = "Uncomplete"
            Report.create!(report_params)
            return "successfully published"
        else
            return "Already been published"
        end
    end
end
