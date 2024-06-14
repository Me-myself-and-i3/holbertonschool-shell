#!/bin/bash
# Function to create a new script file
create_script() {
    local filename="$1"
    # Check if the file already exists
    if [ -e "$filename" ]; then
        echo "Error: File '$filename' already exists."
        return 1
    fi
    # Create the file and add the shebang line
    echo "#!/bin/bash" > "$filename"
    # Make the file executable
    chmod +x "$filename"
    echo "File '$filename' created and made executable."
}
# Check if at least one filename was provided as an argument
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <filename1> <filename2> ... <filenameN>"
    exit 1
fi
# Loop through all provided filenames and create each script file
for filename in "$@"; do
    create_script "$filename"
done
