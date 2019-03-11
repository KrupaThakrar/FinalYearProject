class SeniorsController < InheritedResources::Base

  private

    def senior_params
      params.require(:senior).permit(:name, :email)
    end
end

