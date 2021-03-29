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
