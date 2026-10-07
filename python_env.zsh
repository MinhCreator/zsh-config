function activatevenv() {
  # Check if a virtual environment is already activated
  if [ -z "$VIRTUAL_ENV" ]; then
    # Names of possible virtualenv directories
    VIRTUALENV_DIRS=("venv/" "env/" ".env/" ".venv/" "${PWD##*/}")

    for dir in "${VIRTUALENV_DIRS[@]}"; do
      if [[ -d "${dir}" ]]; then
        # Found a possible venv directory
        # Try activating the venv
        if [[ -e "./${dir}/bin/activate" ]]; then
          source ./$dir/bin/activate
          echo "Virtual environment activated automatically"
          # Store the absolute path of the activated virtual environment directory
          export VENV_PATH=$(realpath ./)
          break
        fi
      fi
    done
  fi
}
activatevenv

# Extension for `cd` command in order to automatically activate virtualenv when changin directories.
function cd() {
  old_dir=$(realpath .)  # Use realpath to get the absolute path
  target_dir=$1
  builtin cd "${target_dir:-$HOME}"

  # If we go up from the VENV_PATH or go somewhere not inside VENV_PATH
  if [[ "${old_dir}" == "${VENV_PATH}"* ]] && [[ "$(realpath .)" != "${VENV_PATH}"* ]]; then
    echo "Leaving python virtual environment"
    deactivate
    unset VENV_PATH
  fi
  
  # Try activating venv
  activatevenv
}
