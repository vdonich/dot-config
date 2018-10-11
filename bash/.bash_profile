# Source every file in the /bash/dots subdirectory

for file in ~/dot-config/bash/dots/*; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
