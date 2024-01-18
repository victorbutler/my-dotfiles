#!/bin/bash
set -eux

# Install ZSH if not present
if [ ! -f /bin/zsh ]; then
    sudo apt install zsh -y
fi
sudo chsh -s /bin/zsh $(whoami)

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


    # cp powerlevel10k/.p10k.zsh $HOME/.p10k.zsh
    cp zsh/.zshrc $HOME/.zshrc
fi