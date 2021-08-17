# Now that we've set up auto-unseal and proper PGP protection
# it's time to get rid of the current root token and generate a
# new root token

# Again we're going to run these commands from the Vault server
ssh -i ~/.ssh/azure_vms_private_key.pem azureuser@PUBLIC_IP_ADDRESS

GPG_TTY=$(tty)
export GPG_TTY

#Revoke the existing root token
vault login

vault token revoke -self
vault token lookup

#Try to log in using the root token
vault login

#Start the root token generation process
vault operator generate-root -init -pgp-key="vaultadmin1.asc"

vault operator generate-root -nonce=NONCE_VALUE

echo "ENCRYPTED_TOKEN" | base64 --decode | gpg -u vaultadmin1 -dq

# Try to log in with the new token
vault login