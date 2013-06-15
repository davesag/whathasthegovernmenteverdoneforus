# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# see http://nanoc.stoneship.org/docs/5-advanced-concepts/

require 'fileutils'

# Copy static assets outside of content instead of having nanoc3 process them.
def copy_static
  FileUtils.cp_r 'static/.', 'output/'
end
