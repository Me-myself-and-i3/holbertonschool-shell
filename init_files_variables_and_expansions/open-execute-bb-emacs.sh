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

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Call the function with the provided filename
create_script "$1"

# Check if the script creation was successful before opening with Emacs
if [ $? -eq 0 ]; then
    emacs "$1"
fi
