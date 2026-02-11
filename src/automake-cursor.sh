#!/bin/bash
# Special thanks to konqi0139 for the automake script and some fixes
dir="Kuromi-cursor/cursors/"	version="2.0"
lik1=circle		lik2=default		lik3=help		lik4=progress	 lik5=move
lik6=bottom_side	lik7=col-resize		lik8=bd_double_arrow	lik9=bottom_left_corner  lik10=text
lik11=link		lik12=cell		lik13=draft	 lik14=up-arrow lik15=dotbox
mkdir  ~/.icons 2> /dev/null

while [[ $1 == -* ]]; do case "$1" in
 -h|--help) printf "\tUsage: $0 [OPTION]\n\nGlobal options:\n\t-h, --help:    show this help message\n\t-v, --version: show version num\n\t-i, --install: install theme at ~/.icons/\n\t\t note: just enter the command without arguments\n\n" && exit ;; -v|--version) printf "\n$version\n\n" && exit ;; -i|--install) tar -xf kuromi-cursor-linux-2.0.tgz -C ~/.icons/ && exit ;; *) printf "Invalid option: $1 \n\n\tType: $0 -h to show help.\n" && exit ;;
esac
done

mkdir -p $dir
cd    circle-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik1

cd ../default-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik2

cd ../help-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik3

cd ../progress-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik4

cd ../move-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik5

cd ../vertical-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik6

cd ../horizontal-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik7

cd ../diagonal1-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik8

cd ../diagonal2-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik9

cd ../text-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik10

cd ../link-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik11

cd ../precision-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik12

cd ../draft-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik13

cd ../up-arrow-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik14

cd ../dotbox-48-96/		|| exit 0 && xcursorgen inst.cursor ../"$dir"$lik15

cd ../watch-48-96/		|| exit 0 && xcursorgen inst.cursor  ../"$dir"watch

cd ../Kuromi-cursor/ || exit 0
printf "[Icon Theme]\nName=Kuromi Cursor\nComment=Kuromi pixel art style cursor. Made by nomixels https://vgen.co/nomixels. This is a reverse engineering project for Linux. Support the original artist." > cursor.theme && ln -s cursor.theme index.theme
cd cursors/ || exit 0
for linkiar in 03b6e0fcb3499374a867c041f52298f0 crossed_circle dnd-no-drop forbidden no-drop not-allowed; do ln -s $lik1 $linkiar
done
for linkiar in arrow left_ptr top_left_arrow; do ln -s $lik2 $linkiar
done
for linkiar in 5c6cd98b3f3ebcb1f9c7f1c204630408 d9ce0ab605698f320427677b458ad60b left_ptr_help question_arrow whats_this; do ln -s $lik3 $linkiar
done
for linkiar in 08e8e1c95fe2fc01f976f1e063a24ccd half-busy left_ptr_watch wait; do ln -s $lik4 $linkiar
done
for linkiar in 4498f0e0c1937ffe01fd06f973665830 9081237383d90e509aa00f00170e968f all-scroll dnd-move dnd-none fleur grabbing pointer-move size_all; do ln -s $lik5 $linkiar
done
for linkiar in 00008160000006810000408080010102 2870a09082c103050810ffdffffe0204 bottom_tee double_arrow n-resize ns-resize row-resize sb_down_arrow sb_up_arrow sb_v_double_arrow size_ver s-resize top_side top_tee v_double_arrow; do ln -s $lik6 $linkiar
done
for linkiar in 028006030e0e7ebffc7f7070c0600140 14fef782d02440884392942c11205230 e-resize ew-resize h_double_arrow left_side left_tee right_side right_tee sb_h_double_arrow sb_left_arrow sb_right_arrow size_hor w-resize; do ln -s $lik7 $linkiar
done
for linkiar in bottom_right_corner c7088f0f3e6c8088236ef8e1e3e70000 lr_angle nw-resize nwse-resize se-resize size_fdiag top_left_corner ul_angle; do ln -s $lik8 $linkiar
done
for linkiar in fcf1c3c7cd4491d801f1e1c78f100000 fd_double_arrow ll_angle ne-resize nesw-resize size_bdiag sw-resize top_right_corner ur_angle; do ln -s $lik9 $linkiar
done
for linkiar in 'text_(old)' ibeam 'ibeam_(old)' xterm; do ln -s $lik10 $linkiar
done
for linkiar in 9d800788f1b08800ae810202380a0822 e29285e634086352946a0e7090d73106 hand hand2 pointer pointing_hand; do ln -s $lik11 $linkiar
done
for linkiar in tcross cross cross_reverse crosshair diamond_cross; do ln -s $lik12 $linkiar
done
for linkiar in draft_large draft_small pencil right_ptr; do ln -s $lik13 $linkiar
done && ln -s $lik14 center_ptr
for linkiar in dot_box_mask dotbox_mask draped_box icon target; do ln -s $lik15 $linkiar
done

cd ../.. || exit 0
tar zcvf kuromi-cursor.tgz Kuromi-cursor/ #&& rm -r kuromi-cursor-linux-2.0/
if [[ $(ls kuromi-cursor.tgz) == kuromi-cursor.tgz ]]; then
printf "    ____  ____  _   ________\n   / __ \/ __ \/ | / / ____/\n  / / / / / / /  |/ / __/\n / /_/ / /_/ / /|  / /___\n/_____/\____/_/ |_/_____/\n"
else
printf "Failed"
fi
