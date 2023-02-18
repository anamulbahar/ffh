#!/bin/sh

license() {
    echo "ffh is licensed under the MIT License"
    echo "MIT License"
    echo ""
    echo "Copyright (c) 2022-2023"
    echo ""
    echo "Permission is hereby granted, free of charge, to any person obtaining a copy"
    echo "of this software and associated documentation files (the \"Software\"), to deal"
    echo "in the Software without restriction, including without limitation the rights"
    echo "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell"
    echo "copies of the Software, and to permit persons to whom the Software is"
    echo "furnished to do so, subject to the following conditions:"
    echo ""
    echo "The above copyright notice and this permission notice shall be included in all"
    echo "copies or substantial portions of the Software."
    echo ""
    echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR"
    echo "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,"
    echo "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE"
    echo "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER"
    echo "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,"
    echo "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE"
    echo "SOFTWARE."
}
if [[ "$1" == "-l"  ||  "$1" == "license"  ||  "$1" == "--license" ]]; then license; exit 1; fi

usage() {
    echo "Usage: {bin} [options] [arguments]"
    echo "Options:"
    echo "  -h, --help, help, show this help message and exit"
    echo "  -v, --version, version, show version and exit"
    echo "  -l, --license, license, show license and exit"
}

if [[ "$1" == "" || "$1" == "-h"  ||  "$1" == "help"  ||  "$1" == "--help" ]]; then usage; exit 1; fi


version() {
    echo "ffh version 0.1.0"
}
if [[ "$1" == "-v"  ||  "$1" == "version"  ||  "$1" == "--version" ]]; then version; exit 1; fi


gccFunction() {
    if [[ "$1" == *".c" ]]; then
        if [[ "$2" == "build" ]]; then
            gcc "$1" -o "$1".bin
        elif [[ "$2" == "run" ]]; then
            gcc "$1" -o "$1".bin && ./"$1".bin
        elif [[ "$2" == "build" ]] && [[ "$3" == "and" ]] && [[ "$4" == "run" ]]; then
            gcc "$1" -o "$1".bin && ./"$1".bin
        else 
            gcc "$1" -o "$1".bin && ./"$1".bin
        fi
    fi
}

# FILE Operation:
if [ -f "$1" ]; then
    # if $1 is gcc then compile and execute $2
    if [ "$1" == "gcc" ]; then gcc "$2" -o "$2".bin && ./"$2".bin; fi

    # if $1 is g++ then compile and execute $2
    if [ "$1" == "g++" ]; then g++ "$2" -o "$2".bin && ./"$2".bin; fi

    # if "$1" contains c file extension, compile and run it.
    if [[ "$1" == *".c" ]]; then gcc "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains cpp file extension, compile and run it.
    if [[ "$1" == *".cpp" ]]; then g++ "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains f90 file extension, compile and run it.
    if [[ "$1" == *".f90" ]]; then gfortran "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains f95 file extension, compile and run it.
    if [[ "$1" == *".f95" ]]; then gfortran "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains f03 file extension, compile and run it.
    if [[ "$1" == *".f03" ]]; then gfortran "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains f08 file extension, compile and run it.
    if [[ "$1" == *".f08" ]]; then gfortran "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains f file extension, compile and run it.
    if [[ "$1" == *".f" ]]; then gfortran "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains d file extension, compile and run it.
    if [[ "$1" == *".d" ]]; then dmd "$1" && -o "$1".bin && ./"$1".bin; fi

    # if $1 contains rs file extension, compile and run it.
    if [[ "$1" == *".rs" ]]; then rustc "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains swift file extension, compile and run it.
    if [[ "$1" == *".swift" ]]; then swiftc "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains hs file extension, compile and run it.
    if [[ "$1" == *".hs" ]]; then ghc "$1" -o "$1".bin && ./"$1".bin; fi

    # if $1 contains py file extension, run it.
    if [[ "$1" == *".py" ]]; then python3 "$1"; fi

    # if $1 contains java file extension, compile and run it.
    if [[ "$1" == *".java" ]]; then javac "$1" && java "${1%.*}"; fi

    # if $1 contains kt file extension, compile and run it.
    if [[ "$1" == *".kt" ]]; then kotlinc "$1" && java "${1%.*}"; fi

    # if $1 contains go file extension, compile and run it.
    if [[ "$1" == *".go" ]]; then go run "$1"; fi

    # if $1 contains js file extension, run it.
    if [[ "$1" == *".js" ]]; then node "$1"; fi

    # if $1 contains sh file extension, run it.
    if [[ "$1" == *".sh" ]]; then bash "$1"; fi

    # if $1 contains php file extension, run it.
    if [[ "$1" == *".php" ]]; then php "$1"; fi

    # if $1 contains rb file extension, run it.
    if [[ "$1" == *".rb" ]]; then ruby "$1"; fi

    # if $1 contains pl file extension, run it.
    if [[ "$1" == *".pl" ]]; then perl "$1"; fi

    # if $1 contains ps1 file extension, run it.
    if [[ "$1" == *".ps1" ]]; then pwsh "$1"; fi

    # if $1 contains cs file extension, compile and run it.
    if [[ "$1" == *".cs" ]]; then mcs "$1" && mono "${1%.*}"; fi

    # if $1 contains vb file extension, compile and run it.
    if [[ "$1" == *".vb" ]]; then vbc "$1" && mono "${1%.*}"; fi

    # if $1 contains ex file extension, compile and run it.
    if [[ "$1" == *".ex" ]]; then elixir "$1"; fi

    # if $1 contains exs file extension, compile and run it.
    if [[ "$1" == *".exs" ]]; then elixir "$1"; fi

    # if $1 contains clj file extension, compile and run it.
    if [[ "$1" == *".clj" ]]; then clojure "$1"; fi

    # if $1 contains cljc file extension, compile and run it.
    if [[ "$1" == *".cljc" ]]; then clojure "$1"; fi

    # if $1 contains cljs file extension, compile and run it.
    if [[ "$1" == *".cljs" ]]; then clojure "$1"; fi

    # if $1 contains cljx file extension, compile and run it.
    if [[ "$1" == *".cljx" ]]; then clojure "$1"; fi

    # if $1 contains lisp file extension, compile and run it.
    if [[ "$1" == *".lisp" ]]; then sbcl --script "$1"; fi

    # if $1 contains r file extension, compile and run it.
    if [[ "$1" == *".r" ]]; then Rscript "$1"; fi

    # if $1 contains rkt file extension, compile and run it.
    if [[ "$1" == *".rkt" ]]; then racket "$1"; fi

    # if $1 contains lua file extension, compile and run it.
    if [[ "$1" == *".lua" ]]; then lua "$1"; fi

    # if $1 contains mp3 or mp4 file extension, play it with ffplay.
    if [[ "$1" == *".mp4" ]] || [[ "$1" == *".mp3" ]] ; then
        if [ "$2" == "tag" ]; then exiftool --TAG "$1";
            elif [ "$2" == "hide" ] && [ "$3" == "play" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "play" ] && [ "$3" == "hide" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "hidden" ] && [ "$3" == "play" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "play" ] && [ "$3" == "hidden" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "play" ] && [ "$3" == "and" ] && [ "$4" == "hide" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "hide" ] && [ "$3" == "and" ] && [ "$4" == "play" ]; then nohup ffplay "$1" -nodisp -autoexit &>/dev/null & echo;
            elif [ "$2" == "play" ]; then nohup ffplay "$1" -autoexit &>/dev/null & echo;
            elif [ "$2" == "stop" ]; then killall ffplay;
            else nohup ffplay "$1" -autoexit &>/dev/null & echo;
        fi
    fi
fi



# ffmpeg, exiftool functions
# if $1 is tag then show tag of $2
if [ "$1" == "tag" ] || [ "$1" == "--tag" ] || [ "$1" == "TAG" ] || [ "$1" == "--TAG" ]; then exiftool --TAG "$2"; fi

# if $1 is convert then convert $2 to $3
if [ "$1" == "convert" ]; then nohup ffmpeg -i "$2" "$3" &>/dev/null & echo; fi

# if $1 is play then:
if [ "$1" == "play" ]; then
    if [ "$2" == "hidden" ]; then nohup ffplay "$3" -nodisp -autoexit &>/dev/null & echo;
    elif [ "$2" == "hide" ]; then nohup ffplay "$3" -nodisp -autoexit &>/dev/null & echo;
    elif [ "$2" == "and" ] && [ "$3" == "hide" ]; then nohup ffplay "$4" -nodisp -autoexit &>/dev/null & echo;
    else nohup ffplay "$2" -autoexit &>/dev/null & echo;
    fi
fi

# if $1 is stop then:
if [ "$1" == "stop" ]; then
    if [ "$2" == "all" ]; then killall ffplay;
    elif [ "$2" == "player" ]; then killall ffplay;
    elif [ "$2" == "playing" ]; then killall ffplay;
    elif [ "$2" == "ffplay" ]; then killall ffplay;
    elif [ "$2" == "music" ]; then killall ffplay;
    elif [ "$2" == "video" ]; then killall ffplay;
    else killall ffplay;
    fi
fi




# rclone functions
# check if rclone is installed. if not, recommend to install it.
if ! command -v rclone &> /dev/null
then
    echo "rclone could not be found. Please install it first.";
    echo "curl https://rclone.org/install.sh | sudo bash";
    exit 1;
fi

if
    [ "$1" == "ls" ] || [ "$1" == "mount" ] || [ "$1" == "unmount" ] && [ $(rclone listremotes | wc -l) = "0" ]; then
    echo "No remotes configured with rclone. Please configure rclone first.";
    exit 1;
elif
    # check if rclone has any remotes configured. if not show rclone config help.
    [ "$1" == "ls" ] && [ "$2" != "all" ] && [ $(rclone listremotes | wc -l) = "0" ]; then
    echo "No remotes configured. Please configure rclone first."
elif
    [ "$1" == "install" ] && [ "$2" == "rclone" ] ; then
    echo "Installing rclone. Sudo password might be required.";
    curl https://rclone.org/install.sh | sudo bash;
elif [ "$1" == "ls" ]; then
    if [ "$2" == "all" ] ; then
        if [ "$3" == "hidden" ] ; then
            nohup echo `for i in $(rclone listremotes); do echo && echo && echo "rclone lsf $i" && rclone lsf $i; done` &>/dev/null & echo;
        else
            for i in $(rclone listremotes); do echo && echo && echo "rclone lsf $i" && rclone lsf $i; done
        fi
    else
        echo && echo && echo "rclone lsf "$2"" && rclone lsf "$2"
    fi
elif [ "$1" == "mount" ] ; then
    if [ "$2" == "all" ] ; then
        for i in $(rclone listremotes | cut -d: -f1); do echo && echo "rclone mount $i:" && mkdir -p ~/Downloads/$i && rclone mount $i:/ ~/Downloads/$i --daemon --vfs-cache-mode full; done
    else
        echo && echo "rclone mount "$2": ~/Downloads/"$2"" && mkdir -p ~/Downloads/"$2" && rclone mount "$2":/ ~/Downloads/"$2" --daemon --vfs-cache-mode full && echo
    fi
elif [ "$1" == "unmount" ] ; then
    if [ "$2" == "all" ] ; then
        for i in $(rclone listremotes | cut -d: -f1); do if [ `uname` = "Darwin" ]; then if [ -d ~/Downloads/$i ]; then umount ~/Downloads/$i && rm -rf ~/Downloads/$i; fi; if [ -d ~/Downloads/$i ]; then diskutil unmount ~/Downloads/$i && rm -rf ~/Downloads/$i; fi; elif [ `uname` = "Linux" ]; then if [ -d ~/Downloads/$i ]; then fusermount -u ~/Downloads/$i && rm -rf ~/Downloads/$i; fi; fi; done
    else
        if [ `uname` = "Darwin" ]; then if [ -d ~/Downloads/"$2" ]; then umount ~/Downloads/"$2" && rm -rf ~/Downloads/"$2"; fi; if [ -d ~/Downloads/"$2" ]; then diskutil unmount ~/Downloads/"$2" && rm -rf ~/Downloads/"$2"; fi; elif [ `uname` = "Linux" ]; then if [ -d ~/Downloads/"$2" ]; then fusermount -u ~/Downloads/"$2" && rm -rf ~/Downloads/"$2"; fi; fi
    fi
fi




# reset functions for macos
#reset_for_mac(){
#    defaults delete com.apple."$what_to_reset"; killall Dock;
#}

# reset dock to default on macos
if [ "$1" == "reset" ] && [ "$2" == "dock" ] && [ `uname` = "Darwin" ]; then defaults delete com.apple.dock; killall Dock; fi

# reset finder to default on macos
if [ "$1" == "reset" ] && [ "$2" == "finder" ] && [ `uname` = "Darwin" ]; then defaults delete com.apple.finder; killall Finder; fi

# reset launchpad to default on macos
if [ "$1" == "reset" ] && [ "$2" == "launchpad" ] && [ `uname` = "Darwin" ]; then defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock; fi
if [ "$1" == "resetl" ] && [ `uname` = "Darwin" ]; then defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock; fi
if [ "$1" == "resetlh" ] && [ `uname` = "Darwin" ]; then sudo chflags hidden /Applications/*; defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock; fi




# vimrc generate
if [ "$1" == "vimrc" ]; then
    if [ "$2" == "generate" ]; then
        if [ -f ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc.old; fi
        if [ -f ~/.vim/vimrc ]; then mv ~/.vim/vimrc ~/.vim/vimrc.old; fi
        mkdir -p ~/.vim && touch ~/.vim/vimrc
        echo "\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"" >> ~/.vim/vimrc
        echo "\"                                                              \"" >> ~/.vim/vimrc
        echo "\"           ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗            \"" >> ~/.vim/vimrc
        echo "\"           ██║   ██║██║████╗ ████║██╔══██╗██╔════╝            \"" >> ~/.vim/vimrc
        echo "\"           ██║   ██║██║██╔████╔██║██████╔╝██║                 \"" >> ~/.vim/vimrc
        echo "\"           ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                 \"" >> ~/.vim/vimrc
        echo "\"            ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗            \"" >> ~/.vim/vimrc
        echo "\"             ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝            \"" >> ~/.vim/vimrc
        echo "\"                                                              \"" >> ~/.vim/vimrc
        echo "\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"" >> ~/.vim/vimrc
        echo "" >> ~/.vim/vimrc
        echo "autocmd BufWinLeave *.* mkview" >> ~/.vim/vimrc
        echo "autocmd BufWinEnter *.* silent loadview" >> ~/.vim/vimrc
        echo "colorscheme habamax" >> ~/.vim/vimrc
        echo "filetype off" >> ~/.vim/vimrc
        echo "filetype plugin on" >> ~/.vim/vimrc
        echo "filetype plugin indent on" >> ~/.vim/vimrc
        echo "imap <F2> <C-O>:set invpaste paste?<CR>" >> ~/.vim/vimrc
        echo "inoremap ( ()<Esc>i" >> ~/.vim/vimrc
        echo "inoremap { {}<Esc>i" >> ~/.vim/vimrc
        echo "inoremap [ []<Esc>i" >> ~/.vim/vimrc
        echo "inoremap < <><Esc>i" >> ~/.vim/vimrc
        echo "inoremap ' ''<Esc>i" >> ~/.vim/vimrc
        echo "inoremap \" \"\"<Esc>i" >> ~/.vim/vimrc
        echo "let g:netrw_banner = 0" >> ~/.vim/vimrc
        echo "let g:netrw_browse_split = 4" >> ~/.vim/vimrc
        echo "let g:netrw_altv = 1" >> ~/.vim/vimrc
        echo "let g:netrw_liststyle = 3" >> ~/.vim/vimrc
        echo "nnoremap <F2> :set invpaste paste?<CR>" >> ~/.vim/vimrc
        echo "nnoremap <silent> <Space> @=(foldlevel('.')?'za':\"\<Space>\")<CR>" >> ~/.vim/vimrc
        echo "set ai" >> ~/.vim/vimrc
        echo "set backspace=indent,eol,start" >> ~/.vim/vimrc
        echo "set clipboard=unnamed" >> ~/.vim/vimrc
        echo "set cursorline" >> ~/.vim/vimrc
        echo "\"set cursorcolumn" >> ~/.vim/vimrc
        echo "set encoding=utf-8" >> ~/.vim/vimrc
        echo "set expandtab" >> ~/.vim/vimrc
        echo "set formatoptions=tcqrn1" >> ~/.vim/vimrc
        echo "set hlsearch" >> ~/.vim/vimrc
        echo "set ignorecase" >> ~/.vim/vimrc
        echo "set incsearch" >> ~/.vim/vimrc
        echo "set laststatus=2" >> ~/.vim/vimrc
        echo "set list" >> ~/.vim/vimrc
        echo "set listchars=tab:›\ ,trail:•,extends:#,nbsp:." >> ~/.vim/vimrc
        echo "set matchpairs+=<:>" >> ~/.vim/vimrc
        echo "set modelines=0" >> ~/.vim/vimrc
        echo "set mouse=a" >> ~/.vim/vimrc
        echo "set nocompatible" >> ~/.vim/vimrc
        echo "set noshiftround" >> ~/.vim/vimrc
        echo "set number" >> ~/.vim/vimrc
        echo "set omnifunc=syntaxcomplete#Complete" >> ~/.vim/vimrc
        echo "set pastetoggle=<F2>" >> ~/.vim/vimrc
        echo "set path+=**" >> ~/.vim/vimrc
        echo "set ruler" >> ~/.vim/vimrc
        echo "set shiftwidth=4" >> ~/.vim/vimrc
        echo "set showcmd" >> ~/.vim/vimrc
        echo "set showmatch" >> ~/.vim/vimrc
        echo "set showmode" >> ~/.vim/vimrc
        echo "set smartcase" >> ~/.vim/vimrc
        echo "set softtabstop=4" >> ~/.vim/vimrc
        echo "set statusline=\ %f%m%=\ %#CursorColumn#\ %y\ [%{&fileformat}:%{&fileencoding}]\ [ascii:%b]\ [hex:0x%B]\ [%l:%c]\ %#CursorRow#\ %p%%\ " >> ~/.vim/vimrc
        echo "set tabstop=4" >> ~/.vim/vimrc
        echo "set ttyfast" >> ~/.vim/vimrc
        echo "set viminfo='100,<9999,s100" >> ~/.vim/vimrc
        echo "set wildmenu" >> ~/.vim/vimrc
        echo "set wildmode=list:longest" >> ~/.vim/vimrc
        echo "set wrap" >> ~/.vim/vimrc
        echo "syntax on" >> ~/.vim/vimrc
        echo "vnoremap <Space> zf" >> ~/.vim/vimrc
    elif [ "$2" == "setup" ]; then
        ffh vimrc generate;
    else
        ffh vimrc generate; 
    fi
fi




# bashrc generate
if [ "$1" == "bashrc" ]; then
    if [ "$2" == "generate" ]; then
        echo "alias ffh='source ~/.ffh/ffh.sh'" >> ~/.bashrc
        echo "alias ffh='source ~/.ffh/ffh.sh'" >> ~/.bash_profile
        echo "alias ffh='source ~/.ffh/ffh.sh'" >> ~/.zshrc
    elif [ "$2" == "setup" ]; then
        ffh bashrc generate;
    else
        ffh bashrc generate; 
    fi
fi




# zshrc generate
if [ "$1" == "zshrc" ]; then
    if [ "$2" == "generate" ]; then
        echo "alias ffh='source ~/.ffh/ffh.sh'" >> ~/.zshrc
    elif [ "$2" == "setup" ]; then
        $1 generate;
    else
        $1 generate; 
    fi
fi




# generate functions
if [ "$1" == "generate" ]; then
    if [ "$2" == "vimrc" ]; then
        ffh vimrc generate;
    elif [ "$2" == "bashrc" ]; then
        ffh bashrc generate;
    elif [ "$2" == "zshrc" ]; then
        ffh zshrc generate;
    fi
fi




# brew functions
if [ "$1" == "brew" ]; then
    if [ "$2" == "clean" ]; then
        brew cleanup --prune=all;
    elif [ "$2" == "upgrade" ]; then
        brew upgrade --greedy;
    fi
fi

# serve this folder which browser-sync
if [ "$1" == "serve" ]; then
    if [ "$2" == "start" ]; then
        nohup browser-sync start --server --files . &>/dev/null & echo $! > .browser-sync.pid;
    elif [ "$2" == "stop" ]; then
        browser-sync stop .browser-sync.pid;
    else 
        browser-sync start --server --files .;
    fi
fi
