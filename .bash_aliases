alias up='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias lsd='ls -ld */'

# Add venv activation and PATH
source /opt/venv/bin/activate
export PATH="/opt/venv/bin:$PATH"
