# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# see http://nanoc.stoneship.org/docs/5-advanced-concepts/

# Copy static assets outside of content instead of having nanoc3 process them.
def copy_static
  `rsync -a static/ output`
end
