#!/bin/bash

# WeKan for Haxe. License: MIT / WeKan Team.

# DONE:
# [X] Install, Update, Build All
# [X] Build each language version separately
# [X] Converting code to/from Haxe as commandline options, but not sure does it work at all.

# TODO:
# [_] Convert PHP prototype to Haxe, create similar HTML with all languages
# [_] Run all languages like CGI scripts
# [_] Each webpage is one function. Like: All Boards, One Board, etc.
# [_] Each part of webpage can also be function: One Card, One Checklist, etc
# [_] Each part can have editable HTML template with variables, similar like Board Settings / Card Settings / Show At Card.

function pause(){
    read -p "$*"
}


if [ $# -ne 4 ]
then
    echo "Code converting commandline options, not sure does it work at all:"
    echo "  ./build.sh convert CONVERSIONTYPE sourcefile targetfile"
    echo "Examples:"
    echo "  ./build.sh convert js_to_haxe code.js code.hx"
    echo "  ./build.sh convert php_to_haxe code.php code.hx"
    echo "Conversion types:"
    echo "   as2_to_haxe  beauty_js haxe_to_cpp java_to_haxe java_to_php-strings   php_to_haxe"
    echo "   beauty_cpp   cs_to_cpp             haxe_to_cs   java_to_php-comments  js_to_haxe           php_to_haxe_typedef"
    echo "   beauty_haxe  cs_to_haxe_comments   haxe_to_ts   java_to_php-file      php_to_haxe_code     ts_to_haxe"
    echo "   beauty_html  cs_to_haxe            java_to_cs   java_to_php           php_to_haxe_extern"
else
    if [ $1 == "convert" ]
    then
        # Git version gives errors:
        #: Error parsing haxelib.json for refactor@git: [file_contents,/home/wekan/haxelib/refactor/git/haxelib.json]
        #Release version maybe older, but does not seem to change code:
        echo haxelib run refactor convertFile --exclude-string-literals --exclude-comments "$3" "$4" ~/haxelib/refactor/4,2,0/rules/$2.rules
        echo
        haxelib run refactor convertFile --exclude-string-literals --exclude-comments "$3" "$4" ~/haxelib/refactor/4,2,0/rules/$2.rules
        exit 1
    fi
fi

echo "Recommended for development: Ubuntu 22.04 amd64 Jammy Jellyfish daily iso, directly to SSD disk or dual boot, not VM. Works fast."
echo
PS3='Please enter your choice: '
options=("Install or update Haxe" "Haxelib Setup" "Haxelib Install All Packages" "Haxelib List" "Haxelib Update" "Build All" "Run All" "Build C++ cpp" "Build C# cs" "Build HashLink hl" "Build Java jar" "Build JVM jar" "Build Lua" "Build Node.js" "Build PHP" "Build Python3" "Run C++ cpp" "Run C# cs" "Run HashLink hl" "Run Java jar" "Run JVM jar" "Run Lua" "Run Node.js" "Run PHP" "Run Python3" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Install or update Haxe")

            if [[ "$OSTYPE" == "linux-gnu" ]]; then
                echo "Linux";
                # Debian, Ubuntu, Mint
                sudo apt-get install -y build-essential gcc g++ make git curl wget cmake
                sudo apt-get install -y p7zip-full zip unzip unp
                sudo apt-get install -y mono-complete
                # PHP 8.1
                sudo apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
                # Ubuntu:
                #sudo apt-get install -y lua5.3 liblua5.3-dev luarocks
                sudo apt-get install -y lua5.4 liblua5.4-dev luarocks
                #sudo apt-get install -y php8.0-cli php8.0-mbstring
                #sudo add-apt-repository -y ppa:ondrej/php  # php8.1 is already in Ubuntu 22.04
                sudo apt-get -y update
                sudo apt-get -y install php8.1 php8.1-cli php8.1-mbstring php8.1-zip php8.1-curl
		#Ubuntu and Mint:
		sudo apt-get install -y openjdk-18-jdk
		#Debian:
		sudo apt-get install -y openjdk-18-jdk-headless
                #
                sudo luarocks install lrexlib-pcre
                sudo luarocks install environ
                sudo luarocks install luasocket
                sudo luarocks install luv
                sudo luarocks install luautf8

                # HashLink deps
                sudo apt-get -y install libpng-dev libturbojpeg-dev libvorbis-dev libopenal-dev libsdl2-dev libmbedtls-dev libuv1-dev
                mkdir ~/repos
                cd ~/repos
                git clone https://github.com/HaxeFoundation/hashlink
                cd ~/repos/hashlink
                make
                # Install HashLink libs to /usr/local/lib
                sudo make install

                # Delete old Haxe binary directory
                rm -rf ~/repos/haxebin
                mkdir -p ~/repos/haxebin
                cd ~/repos/haxebin

                if  [[ $(uname -m) = "x86_64" ]]
                then
                  # Download amd64 Haxe nightly build
                  curl -O https://build.haxe.org/builds/haxe/linux64/haxe_latest.tar.gz
                  curl -O https://build.haxe.org/builds/neko/linux64/neko_latest.tar.gz
                elif [[ $(uname -m) = "aarch64" ]]
                then
                  # Download arm64 new Haxe nightly build
                  curl -O https://build.haxe.org/builds/haxe/linux-arm64/haxe_latest.tar.gz
                  curl -O https://build.haxe.org/builds/neko/linux-arm64/neko_latest.tar.gz
                fi
                # Unarchive Haxe
                tar -xzvf haxe_latest.tar.gz
                tar -xzvf neko_latest.tar.gz

                # Delete archives
                rm haxe*.tar.gz
                rm neko*.tar.gz

                # Rename directories
                mv haxe_* haxe
                mv neko-* neko

                # Update .bashrc
                #cd ~

                # Does not work: Delete old Haxe etc path from .bashrc
                #cat ~/.bashrc | grep -v haxe > ~/.bashrc

                # Maybe later: Add new paths to .bashrc
                #cat ~/repos/wekan/devpath.txt >> ~/.bashrc

                # Maybe laterUse new paths
                #source .bashrc

                # Change back to Wekan directory
                cd ~/repos/w/hx/prototypes/code/hello

                # Show new paths
                echo "_____________________________________"
                echo "Please add these to your ~/.bashrc :"
                echo ""
                cat ~/repos/w/hx/prototypes/code/hello/devpath.txt
                #sudo chown -R $(id -u):$(id -g) $HOME/.npm $HOME/.meteor

            elif [[ "$OSTYPE" == "darwin"* ]]; then
                echo "macOS";
                # Needs XCode installed.
                # Sometimes shows when installing Hashlink:
                # Error: Your Command Line Tools are too outdated.
                # Update them from Software Update in System Preferences or run:
                #  softwareupdate --all --install --force
                # If that doesn't show you any updates, run:
                #  sudo rm -rf /Library/Developer/CommandLineTools
                #  sudo xcode-select --install
                # Run C# code with command: dotnet
                #macOS provides OpenAL.framework, so no need to install openal
                #Changed dotnet-sdk => mono, because dotnet did not work
                #Changed openjdk@11 => openjdk@17
                brew install haxe wget p7zip zip unzip unp screen mono openjdk@17 luarocks php@8.2 libpng jpeg-turbo libvorbis sdl2 mbedtls@2 libuv
                # Install Java
                # Old: sudo ln -sfn /opt/homebres/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
                # https://stackoverflow.com/questions/69875335/macos-how-to-install-java-17
                sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
                luarocks install lrexlib-pcre
                luarocks install environ
                luarocks install luasocket
                luarocks install luv
                luarocks install luautf8
                brew install --build-from-source hashlink
                exit;
            elif [[ "$OSTYPE" == "cygwin" ]]; then
                # POSIX compatibility layer and Linux environment emulation for Windows
                echo "TODO: Add Cygwin";
                exit;
            elif [[ "$OSTYPE" == "msys" ]]; then
                # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
                echo "TODO: Add msys on Windows";
                exit;
            elif [[ "$OSTYPE" == "win32" ]]; then
                # I'm not sure this can happen.
                echo "TODO: Add Windows";
                exit;
            elif [[ "$OSTYPE" == "freebsd"* ]]; then
                echo "TODO: Add FreeBSD";
                exit;
            else
                echo "Unknown"
                echo ${OSTYPE}
                exit;
            fi

            break
            ;;

        "Haxelib Setup")
            echo "Haxelib Setup."
            haxelib setup
            echo Done.
            break
            ;;

        "Haxelib List")
            echo "Haxelib list."
            haxelib list
            echo Done.
            break
            ;;

        "Haxelib Update")
            echo "Haxelib Update."
            haxelib update
            echo Done.
            break
            ;;

        "Haxelib Install All Packages")
            echo "Haxelib Install All Packages."
            haxelib git asys https://github.com/benmerckx/asys --skip-dependencies
            haxelib git ansi https://github.com/SmilyOrg/ansi --skip-dependencies
            haxelib git haxeui-core https://github.com/haxeui/haxeui-core --skip-dependencies
            haxelib git haxeui-html5 https://github.com/haxeui/haxeui-html5 --skip-dependencies
            haxelib git haxeui-hxwidgets https://github.com/haxeui/haxeui-hxwidgets --skip-dependencies
            haxelib git hscript https://github.com/HaxeFoundation/hscript --skip-dependencies
            haxelib git html-entities https://github.com/back2dos/html-entities --skip-dependencies
            haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp --skip-dependencies
            haxelib git http-status https://github.com/kevinresol/http-status --skip-dependencies
            haxelib git hxcs https://github.com/HaxeFoundation/hxcs --skip-dependencies
            haxelib git hxcpp https://github.com/HaxeFoundation/hxcpp --skip-dependencies
            haxelib git hxjava https://github.com/HaxeFoundation/hxjava --skip-dependencies
            haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs --skip-dependencies
            haxelib git hxWidgets https://github.com/haxeui/hxwidgets --skip-dependencies
            haxelib git mime https://github.com/benmerckx/mime --skip-dependencies
            haxelib git mongodb http://github.com/MattTuttle/mongo-haxe-driver --skip-dependencies
            haxelib git mongomod https://bitbucket.org/yar3333/haxe-mongomod --skip-dependencies
            haxelib git mongomod https://github.com/yar3333/haxe-mongomod --skip-dependencies
            # Cound not get git version of refactor working yet.
            haxelib git refactor https://github.com/yar3333/haxe-refactor --skip-dependencies
            #haxelib install refactor --skip-dependencies
            # HaxeLink/C compiler
            #haxelib install hlc-compiler
            #-------------------------------
            # Tink
            haxelib git tink_anon https://github.com/haxetink/tink_anon --skip-dependencies
            haxelib git tink_await https://github.com/haxetink/tink_await --skip-dependencies
            haxelib git tink_spatial https://github.com/haxetink/tink_spatial --skip-dependencies
            haxelib git tink_core https://github.com/haxetink/tink_core --skip-dependencies
            haxelib git tink_cli https://github.com/haxetink/tink_cli --skip-dependencies
            haxelib git tink_csss https://github.com/haxetink/tink_csss --skip-dependencies
            haxelib git tink_concurrent https://github.com/haxetink/tink_concurrent --skip-dependencies
            haxelib git tink_http https://github.com/haxetink/tink_http --skip-dependencies
            haxelib git tink_http_middleware https://github.com/haxetink/tink_http_middleware --skip-dependencies
            haxelib git tink_htmlstring https://github.com/haxetink/tink_htmlstring --skip-dependencies
            haxelib git tink_hxx https://github.com/haxetink/tink_hxx --skip-dependencies
            haxelib git tink_io https://github.com/haxetink/tink_io --skip-dependencies
            haxelib git tink_json https://github.com/haxetink/tink_json --skip-dependencies
            haxelib git tink_lang https://github.com/haxetink/tink_lang --skip-dependencies
            haxelib git tink_macro https://github.com/haxetink/tink_macro --skip-dependencies
            haxelib git tink_multipart https://github.com/haxetink/tink_multipart --skip-dependencies
            haxelib git tink_parse https://github.com/haxetink/tink_parse --skip-dependencies
            haxelib git tink_priority https://github.com/haxetink/tink_priority --skip-dependencies
            haxelib git tink_pure https://github.com/haxetink/tink_pure --skip-dependencies
            haxelib git tink_querystring https://github.com/haxetink/tink_querystring --skip-dependencies
            haxelib git tink_runloop https://github.com/haxetink/tink_runloop --skip-dependencies
            haxelib git tink_semver https://github.com/haxetink/tink_semver --skip-dependencies
            haxelib git tink_slice https://github.com/haxetink/tink_slice --skip-dependencies
            haxelib git tink_spatial https://github.com/haxetink/tink_spatial --skip-dependencies
            haxelib git tink_sql https://github.com/haxetink/tink_sql --skip-dependencies
            haxelib git tink_state https://github.com/haxetink/tink_state --skip-dependencies
            haxelib git tink_streams https://github.com/haxetink/tink_streams --skip-dependencies
            haxelib git tink_stringly https://github.com/haxetink/tink_stringly --skip-dependencies
            haxelib git tink_syntaxhub https://github.com/haxetink/tink_syntaxhub --skip-dependencies
            haxelib git tink_tcp https://github.com/haxetink/tink_tcp --skip-dependencies
            haxelib git tink_testrunner https://github.com/haxetink/tink_testrunner --skip-dependencies
            haxelib git tink_typecrawler https://github.com/haxetink/tink_typecrawler --skip-dependencies
            haxelib git tink_unittest https://github.com/haxetink/tink_unittest --skip-dependencies
            haxelib git tink_url https://github.com/haxetink/tink_url --skip-dependencies
            haxelib git tink_web https://github.com/haxetink/tink_web --skip-dependencies
            haxelib git tink_chunk https://github.com/haxetink/tink_chunk --skip-dependencies
            echo Done.
            break
            ;;

        "Haxelib Setup")
            echo "Haxelib Setup."
            haxelib setup
            echo Done.
            break
            ;;

        "Haxelib List")
            echo "Haxelib List."
            haxelib list
            echo Done.
            break
            ;;

        "Haxelib Update")
            echo "Haxelib Update."
            haxelib update
            echo Done.
            break
            ;;

        "Build All")
            echo "Build All."
            rm -rf .build
            echo "Creating directory .build:"
            mkdir -p .build/node .build/php .build/python .build/cs .build/java .build/jvm .build/cpp .build/lua .build/hl .build/hlc
            echo "Building cpp:"
            (haxelibpath=$(cat ~/.haxelib) && cd $haxelibpath/hxcpp/git/tools/hxcpp && haxe compile.hxml)
            haxe --cpp .build/cpp --main Wekan
            echo "Building node:"
            haxe --js .build/node/wekan.js -lib hxnodejs --main Wekan
            echo "Building php:"
            haxe --php .build/php --main Wekan
            echo "Building python:"
            haxe --python .build/python/wekan.py --main Wekan
            echo "Building cs (C#):"
            # This error is at issue: https://github.com/HaxeFoundation/haxe/issues/6464
            #haxelib run hxcs hxcs_build.txt --haxe-version 4300 --feature-level 1 --out cs/server.cs/bin/Server
            #Note: dmcs is deprecated, please use mcs instead!
            haxe --cs .build/cs --main Wekan
            echo "Building java:"
            haxe --java .build/java --main Wekan
            echo "Building jvm:"
            haxe --jvm .build/jvm/Wekan.jar --main Wekan
            echo "Building lua:"
            haxe --lua .build/lua/wekan.lua --main Wekan
            echo "Building HashLink (hl):"
            haxe --hl .build/hl/wekan.hl --main Wekan
            ## Does not currently work:
            #echo "Building HashLink/C (hlc):"
            #haxe --hl .build/hlc/output.hl --main Wekan
            #cd .build/hlc
            #gcc -O3 -o wekan -std=c++ -I out wekan.c -lhl [-L/usr/local/lib]
            #cd ../..
            echo Done.
            break
            ;;

        "Build C++ cpp")
            echo "Building cpp:"
            mkdir -p .build/cpp
            haxe --cpp .build/cpp --main Wekan
            echo Done.
            break
            ;;

        "Build Node.js")
            echo "Building node:"
            mkdir -p .build/node
            haxe --js .build/node/wekan.js -lib hxnodejs --main Wekan
            echo Done.
            break
            ;;

        "Build PHP")
            echo "Building php:"
            mkdir -p .build/php
            haxe --php .build/php --main Wekan
            echo Done.
            break
            ;;

        "Build Python3")
            echo "Building python:"
            mkdir -p .build/python
            haxe --python .build/python/wekan.py --main Wekan
            echo Done.
            break
            ;;

        "Build C# cs")
            echo "Building C# cs:"
            # This error is at issue: https://github.com/HaxeFoundation/haxe/issues/6464
            #haxelib run hxcs hxcs_build.txt --haxe-version 4300 --feature-level 1 --out cs/server.cs/bin/Server
            #Note: dmcs is deprecated, please use mcs instead!
            mkdir -p .build/cs
            haxe --cs .build/cs --main Wekan
            echo Done.
            break
            ;;

        "Build Java jar")
            echo "Building java:"
            mkdir -p .build/java
            haxe --java .build/java --main Wekan
            echo Done.
            break
            ;;

        "Build JVM jar")
            echo "Building jvm:"
            mkdir -p .build/jvm
            haxe --jvm .build/jvm/Wekan.jar --main Wekan
            echo Done.
            break
            ;;

        "Build Lua")
            echo "Building lua:"
            mkdir -p .build/lua
            haxe --lua .build/lua/wekan.lua --main Wekan
            echo Done.
            break
            ;;

        "Build HashLink hl")
            echo "Building HashLink hl:"
            mkdir -p .build/hl
            haxe --hl .build/hl/wekan.hl --main Wekan
            ## Does not currently work:
            #echo "Building HashLink/C (hlc):"
            #haxe --hl .build/hlc/output.hl --main Wekan
            #cd .build/hlc
            #gcc -O3 -o wekan -std=c++ -I out wekan.c -lhl [-L/usr/local/lib]
            #cd ../..
            echo Done.
            break
            ;;

        "Run All")
            echo "Run C++ cpp"
            .build/cpp/Wekan
            echo "Run C# cs"

            if [[ "$OSTYPE" == "linux-gnu" ]]; then
                echo "Linux";
                mono .build/cs/bin/Wekan.exe
            elif [[ "$OSTYPE" == "darwin"* ]]; then
                echo "macOS";
                #dotnet .build/cs/bin/Wekan.exe
                mono .build/cs/bin/Wekan.exe
            fi

            echo "Run HashLink hl"
            echo "M1 hashlink could be broken: https://github.com/HaxeFoundation/hashlink/pull/577 https://github.com/HaxeFoundation/hashlink/issues/557"
            hl .build/hl/wekan.hl
            echo "Run Java jar"
            java -jar .build/java/Wekan.jar
            echo "Run JVM jar"
            java -jar .build/jvm/Wekan.jar
            echo "Run Lua"
            lua .build/lua/wekan.lua
            echo "Run Node.js"
            node .build/node/wekan.js
            echo "Run PHP"
            php .build/php/index.php
            echo "Run Python3"
            python3 .build/python/wekan.py
            echo Done.
            break
            ;;

        "Run C++ cpp")
            echo "Run C++ cpp"
            .build/cpp/Wekan
            echo Done.
            break
            ;;

        "Run C# cs")
            echo "Run C# cs"
            if [[ "$OSTYPE" == "linux-gnu" ]]; then
                echo "Linux";
                mono .build/cs/bin/Wekan.exe
            elif [[ "$OSTYPE" == "darwin"* ]]; then
                echo "macOS";
                dotnet .build/cs/bin/Wekan.exe
            fi
            echo Done.
            break
            ;;

        "Run HashLink hl")
            echo "Run HashLink hl"
            hl .build/hl/wekan.hl
            echo Done.
            break
            ;;

        "Run Java jar")
            echo "Run Java jar"
            java -jar .build/java/Wekan.jar
            echo Done.
            break
            ;;

        "Run JVM jar")
            echo "Run JVM jar"
            java -jar .build/jvm/Wekan.jar
            echo Done.
            break
            ;;

        "Run Lua")
            echo "Run Lua"
            lua .build/lua/wekan.lua
            echo Done.
            break
            ;;

        "Run Node.js")
            echo "Run Node.js"
            node .build/node/wekan.js
            echo Done.
            break
            ;;

        "Run PHP")
            echo "Run PHP"
            php .build/php/index.php
            #php -S localhost:8000 -t .build/php/
            echo Done.
            break
            ;;

        "Run Python3")
            echo "Run Python3"
            python3 .build/python/wekan.py
            echo Done.
            break
            ;;

        "Quit")
            break
            ;;
        *) echo invalid option ;;
    esac
done
