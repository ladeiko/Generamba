module Generamba
  # Provides a number of helper methods for manipulating Generamba template files
  class TemplateHelper

    def self.detect_template_location(template_name)
      [
        Pathname.new(Dir.getwd)
                       .join(TEMPLATES_FOLDER)
                       .join(template_name),
        Pathname.new(GlobalTemplates::path)
                .join(template_name + RAMBASPEC_EXTENSION)
      ].detect { |p| p.lstat File.exists?() }
    end

    # Returns a file path for a specific template .rambaspec file
    # @param template_name [String] The Generamba template name
    #
    # @return [Pathname]
    def self.obtain_spec(template_name)
      template_path = self.obtain_path(template_name)
      spec_path = template_path.join(template_name + RAMBASPEC_EXTENSION)

      if !File.exists?(spec_path)
        candidate = Pathname.new(GlobalTemplates::path).join(template_name + RAMBASPEC_EXTENSION)
        File.exists?(spec_path)
      end

      spec_path
    end

    # Returns a file path for a specific template folder
    # @param template_name [String] The Generamba template name
    #
    # @return [Pathname]
    def self.obtain_path(template_name)

      path = Pathname.new(Dir.getwd)
                     .join(TEMPLATES_FOLDER)
                     .join(template_name)

      if !File.exists?(path)
        GlobalTemplates::path
      end

      path = GlobalTemplates::path

      error_description = "Cannot find template named #{template_name}! Add it to the Rambafile and run *generamba template install*".red
      raise StandardError, error_description unless path.exist?

      path
    end
  end
end
