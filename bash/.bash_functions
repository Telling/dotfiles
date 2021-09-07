mount_sddata(){
    echo "--> Unlocking disk..."
    udisksctl unlock -b /dev/mmcblk0
    echo "--> Mounting disk..."
    udisksctl mount -b /dev/dm-3
}

unmount_sddata(){
    echo "--> Unmounting disk..."
    udisksctl unmount -b /dev/dm-3
    echo "--> Locking disk..."
    udisksctl lock -b /dev/mmcblk0
}

vimwiki() {
    vim "${PERSONAL_STORAGE_PATH}/vimwiki/index.wiki"
}

# https://stackoverflow.com/a/18915067
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
