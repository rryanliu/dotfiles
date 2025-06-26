# Add the following to your shell rc (e.g. ~/.zshrc or ~/.bashrc):
# Define cf as a shell function so cd persists in your shell

cf() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: cf <directory-name>"
    return 1
  fi

  local CF_DIR="$HOME/coding/codeforces"
  local folder="$1"
  local dest_dir="$CF_DIR/$folder"

  if [[ -e "$dest_dir" ]]; then
    echo "Error: directory '$dest_dir' already exists."
    return 1
  fi
  mkdir -p "$dest_dir"
  echo "Created directory: $dest_dir"

  local template="$CF_DIR/template.cpp"
  if [[ ! -f "$template" ]]; then
    echo "Error: template not found at '$template'."
    return 1
  fi

  for letter in {A..H}; do
    cp "$template" "$dest_dir/${letter}.cpp"
    echo "Created $dest_dir/${letter}.cpp"
  done

  # Move into the new directory
  cd "$dest_dir" || return
  echo "Moved into $dest_dir"
}

