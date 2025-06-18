# ----------------------
# Function to Remove Duplicates from Path
# ----------------------
dedup_path() {
  local -A seen
  local path_array=()
  for dir in ${(s/:/)PATH}; do
    if [[ -z ${seen[$dir]} ]]; then
      path_array+=$dir
      seen[$dir]=1
    fi
  done
  PATH=$(IFS=:; echo "${path_array[*]}")
}
dedup_path
