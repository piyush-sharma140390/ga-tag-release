# Get the current branch name

echo "installing git .."
apt install git -y
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Determine the environment based on the current branch
if [ "$CURRENT_BRANCH" == "develop" ]; then
  ENV_FILE=".env.dev"
elif  [ "$CURRENT_BRANCH" == "qa" ]; then
  ENV_FILE=".env.qa"
elif if [ "$CURRENT_BRANCH" == "main" ]; then
  ENV_FILE=".env.prod"
else
  echo "Unknown branch. Unable to determine environment."
  exit 1
fi
 
# Create the .env file based on the determined environment
echo "Creating $ENV_FILE..."
echo "REACT_APP_API_BASE = $(grep "REACT_APP_API_BASE" $ENV_FILE)" > .env
echo "dot env file created ....."
cat .env
