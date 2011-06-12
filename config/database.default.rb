DB = Sequel.connect(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => '',
  :password => '',
  :database => '',
  :test     => true,
  :encoding => 'utf8',
  :logger   => Ramaze::Logger::RotatingInformer.new(
    __DIR__("../log/database/dev"), '%d-%m-%Y.log'
  )
)