def render(path)
  ERB.new(File.read(File.expand_path(path)), nil, nil, eoutvar = '_sub01').result(binding)
end
