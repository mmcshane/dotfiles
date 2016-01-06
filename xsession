if which vmware-user > /dev/null; then
    vmware-user
elif which vmtoolsd > /dev/null; then
    vmtoolsd -n vmusr &
fi

xmodmap ~/.xmodmap
ssh-add
#display -window root "$HOME/.config/woodbg.jpg"
xsetroot -solid "#121212"
xrdb "$HOME/.Xdefaults"
exec "$HOME/.cabal/bin/xmonad"
