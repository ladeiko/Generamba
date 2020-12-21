module Generamba

  # Provides the functionality to list all of the templates, available in the catalog
  class CatalogTemplateListHelper

    # Finds out all of the templates located in a catalog
    #
    # @param catalog_path [Pathname] The path to a template catalog
    #
    # @return [Array] An array with template names
    def obtain_all_templates_from_a_catalog(catalog_path)

      return [] unless catalog_path.exist?

      contains_specs = catalog_path.children.count { |c|
        c.extname == RAMBASPEC_EXTENSION
      } > 0

      if contains_specs
        return catalog_path.children
                           .map { |child| child.split.last.to_s }
                           .select { |i| /^[a-z0-9_]+\.rambaspec$/.match(i) }
                           .map { |i| i.gsub RAMBASPEC_EXTENSION, '' }
      else
        return catalog_path.children
                        .select {|child| child.directory? && child.split.last.to_s[0] != '.' }
                        .map { |child| child.split.last.to_s }
      end
    end

    def template_path(catalog_path, template_name)
      contains_specs = catalog_path.children.count { |c|
        c.extname == RAMBASPEC_EXTENSION
      } > 0

      if contains_specs
        return catalog_path
      else
        return catalog_path.join(template_name)
      end
    end

  end

end