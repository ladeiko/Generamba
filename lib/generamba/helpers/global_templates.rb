module Generamba

  class GlobalTemplates
    require 'fileutils'
    require "tty-prompt"

    def self.check_environment

      `which git`

      unless $?.success?
        puts('Git does not installed!'.red)
        exit 1
      end

    end

    def self.templates
      global_templates_path = Pathname.new(ENV['HOME'])
                                      .join(GENERAMBA_HOME_DIR)
                                      .join(GLOBAL_TEMPLATES_DIR)
      Dir.entries(global_templates_path).select { |i| /^[a-z0-9_]+\.rambaspec$/.match(i) }.map { |i| i.gsub '.rambaspec', '' }.sort
    end

    def self.update

      self.check_environment()

      global_templates_path = Pathname.new(ENV['HOME'])
                                .join(GENERAMBA_HOME_DIR)
                                .join(GLOBAL_TEMPLATES_DIR)

      if File.exists?(global_templates_path)
        Dir.chdir(global_templates_path) {
          `git pull`
        }
      else
        `git clone '#{GLOBAL_TEMPLATE_REPOSITORY_URL}' '#{global_templates_path}'`
      end
    end

  end
end
