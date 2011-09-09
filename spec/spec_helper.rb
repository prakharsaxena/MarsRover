require 'bundler'
Bundler.require(:test)

require 'mission'

def test_file
  './README.markdown'
end

def test_data
  File.open(test_file, File::RDONLY).read
end

def run(*args)
  output = Struct.new(:pid, :stdout, :stderr)

  status = Open4.popen4(*args) do |pid, stdin, stdout, stderr|
    output = output.new pid, stdout.read, stderr.read
  end

  [status, output]
end
