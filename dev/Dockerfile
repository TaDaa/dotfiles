FROM debian:latest

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install software-properties-common
RUN apt-get -y install g++ cmake pkg-config python3-pynvim

RUN apt-get -y install curl nodejs npm git

RUN mkdir /root/workspaces
RUN cd /root/workspaces
RUN echo "copying settings4"
RUN git clone 'https://github.com/TaDaa/.vim' /root/.vim
RUN mkdir /root/.config
RUN mkdir /root/.config/nvim
RUN echo "source /root/.vim/_vimrc" > /root/.config/nvim/init.vim
RUN ln /root/.vim/_vimrc /root/.vimrc
RUN ln /root/.vim/coc-settings.json /root/.config/nvim/coc-settings.json
RUN curl -fLo /root/.vim/plugin-data/vim-plug/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN curl -fLo /root/neovim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
RUN tar xzvf /root/neovim.tar.gz
RUN rm /usr/bin/nvim
RUN ln -s /nvim-linux64/bin/nvim /usr/bin/nvim
RUN cd /root/.vim/plugin-data
#RUN git clone 'https://github.com/benfrain/nord-iterm2'
RUN git clone 'https://github.com/scrooloose/nerdtree' /root/.vim/plugin-data/nerdtree
RUN git clone 'https://github.com/scrooloose/nerdcommenter' /root/.vim/plugin-data/nerdcommenter
RUN git clone 'https://github.com/tpope/vim-surround' /root/.vim/plugin-data/vim-surround
RUN git clone 'https://github.com/tpope/vim-projectionist' /root/.vim/plugin-data/vim-projectionist
RUN git clone 'https://github.com/tpope/vim-eunuch' /root/.vim/plugin-data/vim-eunuch
RUN git clone 'https://github.com/tpope/vim-abolish' /root/.vim/plugin-data/vim-abolish
RUN git clone 'https://github.com/tpope/vim-repeat' /root/.vim/plugin-data/vim-repeat
RUN git clone 'https://github.com/tpope/vim-fugitive' /root/.vim/plugin-data/vim-fugitive
RUN git clone 'https://github.com/tmsvg/pear-tree' /root/.vim/plugin-data/pear-tree
RUN git clone 'https://github.com/mattn/emmet-vim' /root/.vim/plugin-data/emmet-vim
RUN git clone 'https://github.com/rking/ag.vim' /root/.vim/plugin-data/ag.vim
RUN git clone 'https://github.com/joshdick/onedark.vim' /root/.vim/plugin-data/onedark.vim
RUN git clone 'https://github.com/rakr/vim-one' /root/.vim/plugin-data/vim-one
RUN git clone 'https://github.com/SirVer/ultisnips' /root/.vim/plugin-data/ultisnips
RUN git clone 'https://github.com/tpope/vim-sleuth' /root/.vim/plugin-data/vim-sleuth
RUN git clone 'https://github.com/airblade/vim-gitgutter' /root/.vim/plugin-data/vim-gitgutter
RUN git clone 'https://github.com/TaDaa/vimade' /root/.vim/plugin-data/vimade
RUN git clone 'https://github.com/junegunn/fzf' /root/.vim/plugin-data/fzf
RUN git clone 'https://github.com/junegunn/fzf.vim' /root/.vim/plugin-data/fzf.vim
RUN git clone 'https://github.com/mg979/vim-visual-multi' /root/.vim/plugin-data/vim-visual-multi
RUN git clone 'https://github.com/morhetz/gruvbox' /root/.vim/plugin-data/gruvbox
RUN git clone 'https://github.com/w0ng/vim-hybrid' /root/.vim/plugin-data/vim-hybrid
RUN git clone 'https://github.com/maksimr/vim-jsbeautify' /root/.vim/plugin-data/vim-jsbeautify
RUN git clone 'https://github.com/ryanoasis/vim-devicons' /root/.vim/plugin-data/vim-devicons
RUN git clone 'https://github.com/neoclide/coc.nvim' /root/.vim/plugin-data/coc.nvim
RUN git clone 'https://github.com/tmux-plugins/vim-tmux-focus-events' /root/.vim/plugin-data/vim-tmux-focus-events
RUN git clone 'https://github.com/airblade/vim-rooter' /root/.vim/plugin-data/vim-rooter
RUN git clone 'https://github.com/vimwiki/vimwiki' /root/.vim/plugin-data/vimwiki
RUN git clone 'https://github.com/nvim-treesitter/nvim-treesitter' /root/.vim/plugin-data/nvim-treesitter
RUN git clone 'https://github.com/nvim-treesitter/playground' /root/.vim/plugin-data/playground

RUN /root/.vim/plugin-data/fzf/install --all
RUN cd /root/.vim/plugin-data/coc.nvim && npm install
RUN nvim -c ":TSInstallSync c cpp javascript typescript | q!"
RUN nvim -c ":TSInstallSync css go html | q!"
RUN nvim -c ":TSInstallSync json lua php | q!"
RUN nvim -c ":TSInstallSync phpdoc rust ruby | q!"
RUN nvim -c ":TSInstallSync regex r scss | q!"
RUN nvim -c ":TSInstallSync sql vim vimdoc | q!"
RUN nvim -c ":TSInstallSync yaml | q!"

RUN nvim -c ":CocInstall -sync coc-tsserver | qa!"
RUN nvim -c ":CocInstall -sync coc-html | qa!"
RUN nvim -c ":CocInstall -sync coc-python | qa!"
RUN nvim -c ":CocInstall -sync coc-css | qa!"
RUN nvim -c ":CocInstall -sync coc-json | qa!"
RUN nvim -c ":CocInstall -sync coc-prettier | qa!"
RUN nvim -c ":CocInstall -sync coc-pairs | qa!"
RUN nvim -c ":CocInstall -sync coc-highlight | qa!"
RUN nvim -c ":CocInstall -sync coc-project | qa!"
RUN nvim -c ":CocInstall -sync coc-yaml | qa!"
RUN nvim -c ":CocInstall -sync coc-snippets | qa!"

#clangd
RUN nvim -c ":CocInstall -sync coc-clangd | qa!"
RUN apt-get -y install clangd


# libpistache - code looks clean but not websockets
#RUN apt-get -y install libpistache-dev

#  drogon
RUN apt-get -y install gcc libjsoncpp-dev uuid-dev zlib1g-dev openssl libssl-dev
RUN ln -s /usr/include/jsoncpp/json /usr/include/json
RUN cd /root/workspaces && git clone https://github.com/drogonframework/drogon
RUN cd /root/workspaces/drogon && git submodule update --init
RUN mkdir /root/workspaces/drogon/build
RUN cd /root/workspaces/drogon/build && cmake .. && make && make install
RUN mkdir /root/workspaces/mgame-dev/server/src/third-party
RUN ln -s /root/workspaces/drogon /root/workspaces/mgame-dev/server/src/third-party/drogon

# oat++
#RUN cd /root/workspaces && git clone https://github.com/oatpp/oatpp.git
#RUN cd /root/workspaces/oatpp && mkdir build && cd build && cmake .. && make install

# uWebSockets
#RUN cd /root/workspaces && git clone --recurse-submodules https://github.com/uNetworking/uWebSockets
#RUN cd /root/workspaces/uWebSockets && make install


# RUN nvim --headless --listen localhost:6666 &
ENV NVIM_LISTEN_ADDRESS 0.0.0.0:6666 
CMD ["nvim","--headless"]

EXPOSE 6666-6668
