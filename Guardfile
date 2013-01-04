# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', rspec: false, cucumber: false, test_unit: { 'RAILS_ENV' => 'test' }, wait: 60 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
  watch(%r{^app/models/.+/.+\.rb$})
end

guard :test, drb: true, all_on_start: false, all_after_pass: false do
  # Tests
  watch( %r{^test/.*/transient_objects/.+_test\.rb$} )

  # Models
  watch( %r{^app/models/transient_objects/(.+)\.rb$} ) do |m| 
    "test/unit/transient_objects/#{m[1]}_test.rb"
  end
end
