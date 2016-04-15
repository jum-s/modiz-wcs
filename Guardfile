guard :minitest, cmd: 'bundle exec test' do
  watch(%r{^test/test_helper\.rb$}){ 'test' }
  watch(%r{^lib/(.+)\.rb$}){ 'test' }
  watch(%r{^test/(.+)\.rb$})
end
scope plugin: [:minitest]

