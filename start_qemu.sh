sudo umount linux-image
qemu-system-x86_64 -kernel kernel/arch/x86_64/boot/bzImage -append 'root=/dev/sda rw' linux-image
