cf () {
    # Check if exactly one argument is passed
    if [ "$#" -ne 1 ]; then
        echo "Usage: mkcf <directory-name>"
        return 1
    fi

    # Create the directory inside $CF
    cd $CF
    mcd "$1" && echo "Created directory: $1"

    # Check if template.cpp exists
    local template="$CF/template.cpp"
    if [ ! -f "$template" ]; then
        echo "Error: $template does not exist!"
        return 1
    fi

    # Copy template.cpp to A.cpp, B.cpp, ..., H.cpp
    for problem in {A..H}; do
        cp "$template" "$problem.cpp" && echo "Created $problem.cpp"
    done
}
