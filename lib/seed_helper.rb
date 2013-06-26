class SeedHelper
  class << self

    def seed_all
      data = JSON.parse(File.read("#{Rails.root}/config/defaults.json"))

      data['categories'].each do |short_name, name|
        Category.create(name: name, short_name: short_name)
      end

      data['education_levels'].each do |short_name, name|
        EducationLevel.create(name: name, short_name: short_name)
      end      
    end
    
  end
end