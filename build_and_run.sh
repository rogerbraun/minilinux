#!/bin/sh
sh get_sources.sh
sh extract_and_compile_busybox.sh
sh extract_and_compile_kernel.sh
sh prepare_image.sh
sh install_system.sh
sh start_qemu.sh
