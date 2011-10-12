require File.expand_path('plain', File.dirname(__FILE__))

Tilt.register Tilt::PlainHtmlTemplate, 'htmf'
Tilt.register Tilt::PlainCssTemplate, 'css'
Tilt.register Tilt::RubyPoweredMarkdown, 'rmd'
Tilt.register Tilt::MarkdownVars, 'mdv'

#Add support for this new config string
Nesta::Config.settings << "intense_debate_account_id"

module Nesta
  module Plugin
    module Simplicity
      module Helpers
        # If your plugin needs any helper methods, add them here...
        def local_stylesheet_link_tag(name)
          pattern = File.expand_path("views/#{name}.{scss,sass,css}", Nesta::App.root)
          if Dir.glob(pattern).size > 0
            haml_tag :link, :href => "/css/#{name}.css", :rel => "stylesheet"
          end
        end
      end
    end
  end

  class App
    helpers Nesta::Plugin::Simplicity::Helpers
  end
  
  class FileModel
    
    
    def inline_summary
      metadata("summary")
    end
    
    private
    
    def convert_to_html(format, scope, text)
      if not self.metadata("renderer").nil? 
        renderer = Regexp.new("(:|^)" + Regexp.escape(self.metadata("renderer")) + "$", :ignorecase)
        template = Tilt.mappings.values.flatten.select{ |obj| renderer.match(obj.name) }.first.new { text }
      else
        template = Tilt[format].new { text }
      end
      template.render(scope)
    end
    
  end
    
  
  

  module Overrides
    module Renderers

      def erb(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :erb)
        super(template, defaults.merge(options), locals)
      end

      def erubis(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :erubis)
        super(template, defaults.merge(options), locals)
      end

      def haml(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :haml)
        super(template, defaults.merge(options), locals)
      end

      def sass(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :sass)
        super(template, defaults.merge(options), locals)
      end

      def scss(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :scss)
        super(template, defaults.merge(options), locals)
      end

      def less(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :less)
        super(template, defaults.merge(options), locals)
      end

      def builder(template=nil, options={}, locals={}, &block)
        defaults, engine = Overrides.render_options(template, :builder)
        super(template, defaults.merge(options), locals, &block)
      end

      def liquid(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :liquid)
        super(template, defaults.merge(options), locals)
      end

      def markdown(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :markdown)
        super(template, defaults.merge(options), locals)
      end

      def textile(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :textile)
        super(template, defaults.merge(options), locals)
      end

      def rdoc(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :rdoc)
        super(template, defaults.merge(options), locals)
      end

      def radius(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :radius)
        super(template, defaults.merge(options), locals)
      end

      def markaby(template = nil, options = {}, locals = {}, &block)
        defaults, engine = Overrides.render_options(template, :mab)
        super(template, defaults.merge(options), locals, &block)
      end

      def coffee(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :coffee)
        super(template, defaults.merge(options), locals)
      end

      def slim(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :slim)
        super(template, defaults.merge(options), locals)
      end

      def creole(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :creole)
        super(template, defaults.merge(options), locals)
      end

      def nokogiri(template = nil, options = {}, locals = {}, &block)
        defaults, engine = Overrides.render_options(template, :nokogiri)
        super(template, defaults.merge(options), locals, &block)
      end



      def css(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :css)
        super(template, defaults.merge(options), locals)
      end

      def stylesheet(template, options = {}, locals = {})
        defaults, engine = Overrides.render_options(template, :sass, :scss, :css)
        renderer = Sinatra::Templates.instance_method(engine)
        renderer.bind(self).call(template, defaults.merge(options), locals)
      end
    end
  end
end

