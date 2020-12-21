require 'generamba/template/helpers/catalog_downloader'
require 'generamba/template/helpers/catalog_template_list_helper'

module Generamba::CLI
  class Template < Thor
    include Generamba

    desc 'list', 'Prints out the list of all templates available in the shared GitHub catalog'
    def list
      templates = TemplateHelper.global_templates
      templates.each do |template_name|
        puts(template_name)
      end
    end
  end
end