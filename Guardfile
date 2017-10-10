guard :shell do
  watch(/doorlock.rb/) { system('ruby doorlock.rb') }
  watch(%r{^lib/.+/.+\.rb}) { system('ruby doorlock.rb') }
end
