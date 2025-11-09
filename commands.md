# Useful Commands

## Update Config Files

```bash
cat ~/.zshrc > configs/.zshrc
cat ~/.zprofile > configs/.zprofile
cat ~/.gitconfig > configs/.gitconfig
cat ~/.gitignore_global > configs/.gitignore_global
cat ~/.nanorc > configs/.nanorc
cat ~/.psqlrc > configs/.psqlrc
```

## Install All Packages

```bash
# Install all packages from Brewfile
brew bundle install

# Update Brewfile after installing new packages
brew bundle dump
```
