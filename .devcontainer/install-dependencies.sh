PYTHON_VERSION=3.12

export TERM=xterm-256color

# nvim install
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

# nvim config
git clone git@github.com:cchetanpatel/nvim.git /home/vscode/.config/nvim

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install node

# Python and  conda environment

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
chmod +x Miniconda3-latest-Linux-x86_64.sh 
sudo bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda
rm Miniconda3-latest-Linux-x86_64.sh 

# Activate conda and create a dev env
source /opt/miniconda/bin/activate
conda create --name dev python=$PYTHON_VERSION
conda activate dev

# Install Pytorch Cuda 118 is most stable if using WSL2
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install jupyter
pip3 install jupyterlab
# mkdir $HOME/.jupyter
# cp /workspaces/aidevcontainer/.devcontainer/jupyter_lab_config.py /home/vscode/.jupyter/jupyter_lab_config.py

#Install pip libraries
pip3 matplotlib
pip3 pandas