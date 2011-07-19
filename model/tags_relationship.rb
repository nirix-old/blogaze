class TagsRelationship < Sequel::Model
  many_to_one :tag
  
  #def self.tag
  #  Tag.where(:id => self.tag_id)
  #end
end