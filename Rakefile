require 'rubygems'
require 'rake'

CONFIG = {
  :less => {
    :input => 'css/less',
    :output => 'css/compiled',
    :input_ext => '.less',
    :output_ext => '.css'
  },
  :coffee => {
    :input => File.join('.', 'app'),
    :output => File.join('.', 'public', 'js')
  }
}

desc "Compile CoffeeScript, and Less"
task :compile do
  sh "coffee -o scripts/compiled -c scripts/coffeescript/*.coffee"
  Rake::Task['less'].invoke
end

desc "Compile Less"
task :less do
  require 'less'
  puts "Compiling LESS..."
  parser = Less::Parser.new
  compile_files(CONFIG[:less]) do |inputFile, outputFile|
    outputFile.write parser.parse(File.new(inputFile).read).to_css
  end
end

#
# Compile all files from input to output
#
def compile_files(options)
    
  recurse_folder(options[:input], options[:input_ext]) do |inputFile|
    
    # Construct the resulting file name
    targetName = options[:output] + inputFile.gsub(/#{options[:input]}/, "")

    # Change output extension
    targetName = targetName.gsub(/#{options[:input_ext]}/, options[:output_ext])
    targetDir = File.dirname targetName
    
    # Make the folders if not exists
    mkdir_p targetDir, :verbose => false if not File.directory? targetDir
    
    # Open files and run block on each file
    File.open(targetName, File::CREAT|File::TRUNC|File::RDWR, 0644) do |outputFile|
      yield inputFile, outputFile
    end
  end
end

#
# Recursively search a folder for file with the ext extension.
#
def recurse_folder(folder, ext = ".")
  # Get full path to files
  filepath = File.join(folder, '**', '*.*')
  
  # Get all files recursively
  if ext == "."
    files = Dir[filepath]
  else
    files = Dir[filepath].select do |file| 
      File.extname(file) == ext
    end
  end
  
  files.each do |file|
    yield file
  end
end