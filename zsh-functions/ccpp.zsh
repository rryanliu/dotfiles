ccpp() {
  # Ensure at least one argument
  if [[ $# -lt 1 ]]; then
    echo "Usage: ccpp <source_file_without_extension_or_with_.cpp>"
    return 1
  fi

  local file="$1"
  local src out

  # Determine source and output names
  if [[ "$file" == *.cpp ]]; then
    src="$file"
    out="${file%.cpp}"
  elif [[ -f "${file}.cpp" ]]; then
    src="${file}.cpp"
    out="$file"
  else
    echo "Error: File '$file' or '${file}.cpp' not found."
    return 1
  fi

  # Compile with strict warnings and sanitizers
  g++ -Wall -Wfatal-errors -g -std=c++17 -fsanitize=undefined,address "$src" -o "$out"

  echo "Compiled $src -> $out"
}

