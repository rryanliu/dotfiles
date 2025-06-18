mcd() {
  # Check if exactly one argument is passed
  if [ "$#" -ne 1 ]; then
    echo "Usage: mcd <directory-name>"
    return 1
  fi

  # Create the directory and navigate into it
  mkdir -p "$1" && cd "$1" || echo "Failed to create or navigate to directory: $1"
}
