DB = Sequel.connect(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => '',
  :password => '',
  :database => '',
  :test     => true,
  :encoding => 'utf8',
  :charset => 'utf8_general_ci'
)