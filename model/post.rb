class Post < Sequel::Model
  many_to_one :user
  
  def validate
    validates_presence [:title, :body, :user_id]
    validates_integer :user_id
  end
  
  def before_create
    self.created_at ||= Time.now.to_i
    super
  end
end