#!/bin/bash
set -eux

# Install exa if not present
if [ ! -f $HOME/bin/exa ]; then
    curl -LO https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
    unzip -j exa-linux-x86_64-v0.10.0.zip bin/exa -d $HOME/bin
    chmod 755 $HOME/bin/exa
    rm -f exa-linux-x86_64-v0.10.0.zip
    sed -i "s#^alias ll=.*##" $HOME/.bashrc
fi

# Install ZSH if not present
if [ ! -f /bin/zsh ]; then
    sudo apt install zsh -y
    sudo chsh -s /bin/zsh $(whoami)
fi

# Install nvm
if [ ! -d $HOME/.nvm ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Set up oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ] && [ -f /bin/zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # PowerLevel19k Theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

    # Plugins
    git clone --depth=1 \
        https://github.com/grigorii-zander/zsh-npm-scripts-autocomplete.git \
        $HOME/.oh-my-zsh/custom/plugins/zsh-npm-scripts-autocomplete
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone --depth=1 \
        https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
        $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-autosuggestions.git \
        $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    # sed -i -e 's#plugins=(git)#plugins=(git node npm dotenv zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-npm-scripts-autocomplete)#g' $HOME/.zshrc


    cp powerlevel10k/.p10k.zsh $HOME/.p10k.zsh
    cp zsh/.zshrc $HOME/.zshrc
fi

# Install Crush CLI from CharmBracelet
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install crush
