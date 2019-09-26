which -s brew >/dev/null 2>&1
if [[ $? != 0 ]] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Tolsadus/42homebrewfix/master/install.sh)"
    source ~/.zshrc
fi

if [ -d "$HOME/.brew/opt/docker-machine" ] && [ -d "$HOME/.brew/opt/docker" ]  && [ -d "$HOME/.brew/opt/docker-compose" ]; then
    echo "Docker stuff already exists"
else
    brew install docker
    brew install docker-compose
    brew install docker-machine
fi

docker-machine create --driver virtualbox Char
docker-machine ip Char
#docker-machine start Char
#very important line
eval $(docker-machine env Char)

#docker-compose up -d