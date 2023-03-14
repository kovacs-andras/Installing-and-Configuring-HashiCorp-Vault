# First we will install Vault, pick the steps for your OS
# If you're using a different flavor of Linux, check out
# the directions available here: https://learn.hashicorp.com/tutorials/vault/getting-started-install?in=vault/getting-started#install-vault

# MacOS

brew tap hashicorp/tap
brew install hashicorp/tap/vault

# Ubuntu

curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo cat > /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install vault


# Now let's verify it installed successfully and is in the PATH 
# environment variable
vault version