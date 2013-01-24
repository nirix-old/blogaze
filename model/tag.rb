#
# Blogaze
# Copyright (C) 2013 Jack Polgar
#
# Blogaze is released under the BSD 3-clause license.
#

class Tag < Sequel::Model
  def href
    "/tags/#{slug}"
  end

  def before_save
    self.slug = Innate::Helper::CGI.u(self.name.scan(/\w+/).join('-')).downcase
  end
end
