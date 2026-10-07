# Copy and paste these lines into your ~/.zshrc and restart the terminal.

# Automatically activates venv if ./venv/ exists in curent directory
#   Go to your project folder, run "pip virtualenv <.venv|venv>", so your project folder
#   has a <.venv|venv> folder at the top level
#   .
#   ├── <other_project_files>
#   ├── ...
#   └── <.venv|venv>
#       ├── bin
#       ├── include
#       └── lib
#
#   The virtualenv will be activated automatically when you enter the directory.
#   To deactivate run `deactivate` and to manually activate run `activatevenv`
function activatevenv() {
  # Names of possible virtualenv directories
  VIRTUALENV_DIRS=("venv/" ".venv/" "${PWD##*/}")

  for dir in $VIRTUALENV_DIRS; do
    if [[ -d "${dir}" ]]; then
      # Found a possible venv directory
      # Try activating the venv
      if [[ -e "./${dir}/bin/activate" ]]; then
        source ./$dir/bin/activate
        echo "Virtual environment activated automatically"
      fi
    fi
  done

}
activatevenv

# Automatically list directory contents upon changing directories and to automatically acticate virtualenv 
function cd() {
  # builtin cd $1
  old_dir=$(realpath .)  # Use realpath to get the absolute path
  builtin cd "$@" && ls
  # If we go up from the VENV_PATH or go somewhere not inside VENV_PATH
  if [[ "${old_dir}" == "${VENV_PATH}"* ]] && [[ "$(realpath .)" != "${VENV_PATH}"* ]]; then
    echo "Leaving python virtual environment"
    deactivate
    unset VENV_PATH
  fi

  # Try activating venv
  activatevenv
}
