module Rvmify
  VERSION = '0.2.0'
  
  class << self
  
    def write_unless_exists(path, filename, contents)
      writefile = File.join(path, filename)
      unless File.exist?(writefile)
        File.open(writefile, 'w') { |f| f.write(contents) }
      else
        puts "#{writefile} not written, #{writefile} already exists!"
      end
    end
  
    def rvmrc_file(project_name)

      ruby_path = `which ruby`.strip
      ruby_version = File.basename(ruby_path.gsub(/\/bin\/ruby/,''))

      environment_path = File.join(ENV['rvm_path'], 'environments', ENV['RUBY_VERSION'])

      # Project specific .rvmrc file
      contents = <<-END
if [[ -s "#{environment_path}" ]] ; then
  . "#{environment_path}"
else
  rvm --create use "#{ruby_version}"
fi

[[ -s "#{project_name}.gems" ]] && rvm gemset use #{project_name}

bundle install
END
    end
  
    def generate(path)
      project_name = File.basename(path)

      # .gems file
      write_unless_exists(path, "#{project_name}.gems", "bundler -v0.9.26")

      # Gemfile
      write_unless_exists(path, "Gemfile", "#install all project gems here")

      # Project specific .rvmrc file
      write_unless_exists(path, ".rvmrc", rvmrc_file(project_name))
    end

  end
end