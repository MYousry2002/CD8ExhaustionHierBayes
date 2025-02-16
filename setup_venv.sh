#!/bin/bash

# Define the environment name
ENV_NAME="CD8ExhaustionHierBayes_env"

echo "Setting up the environment: $ENV_NAME"

# Check for Python 3.9 or higher
PYTHON_CMD=$(command -v python3.9 || command -v python3 || command -v python)

if [[ -z "$PYTHON_CMD" ]]; then
    echo "Error: Python 3.9+ is not installed. Please install Python 3.9 or higher."
    exit 1
fi

# Ensure it's version 3.9+
PYTHON_VERSION=$($PYTHON_CMD --version | awk '{print $2}')
REQUIRED_VERSION="3.9"

if [[ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]]; then
    echo "Error: Python version must be 3.9 or higher. Found: $PYTHON_VERSION"
    exit 1
fi

echo "Using Python: $PYTHON_CMD (version $PYTHON_VERSION)"
$PYTHON_CMD -m venv $ENV_NAME

# Create a virtual environment 
echo "Creating virtual environment..."
python3.9 -m venv $ENV_NAME

# Activate the virtual environment 
if [ "$(uname)" == "Darwin" ] || [ "$(uname)" == "Linux" ]; then
    ACTIVATE="./$ENV_NAME/bin/activate"
else
    ACTIVATE="./$ENV_NAME/Scripts/activate"
fi

echo "Activating virtual environment..."
source $ACTIVATE

# Install dependencies 
echo "Installing dependencies from requirements.txt..."
pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
else
    echo "Error: requirements.txt not found."
    exit 1
fi

# Add environment to Jupyter 
echo "Installing ipykernel for Jupyter..."
pip install ipykernel

echo "Adding environment to Jupyter kernels..."
python -m ipykernel install --user --name=$ENV_NAME --display-name "Python ($ENV_NAME)"

# Start Jupyter Notebook 
echo "Done! Now you can run the Jupyter Notebooks with this environment Python (CD8ExhaustionHierBayes_env)." 