![](https://i.imgur.com/Pqk4HFX.png)
![](https://i.imgur.com/0DLRaMi.jpg)

# dotfiles

My dotfiles from my main laptop running Arch Linux and bspwm. 

Created using the technique described [here](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/). If it's gone, here's [an archive](https://web.archive.org/web/20170326125752/https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

The only change I made to the above technique was the addition of this readme. I wanted to come back to the above article explaining the somewhat non-trivial steps in restoring these dotfiles, so I wanted to add a readme. However, I didn't want a `README.md` chilling in my home directory. So, I added this, committed, and then removed it. Then I ran `config update-index --assume-unchanged README.md`. This got git off my case for deleting it. 

So if you clone this, all you need to do to remove the readme is:
```
~ » rm README.md
~ » config update-index --assume-unchanged README.md
```
