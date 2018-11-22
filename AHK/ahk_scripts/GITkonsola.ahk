; **komendy gita, ktore podmieniaja sie tylko w jego konsoli
; do dodania w przyszlosci:
; https://www.durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/

#IfWinActive ahk_class mintty
::gs::git status
::gl::git ll
::gd::git diff
::gdt::git difftool
::gmt::git mergetool
::gc::git commit
::gcae::git commit --allow-empty
::gch::git checkout
::gr::git rebase -i 
::gb::git branch
::gst::git stash
::ga::git add -p
::gai::git add -i
::gf::git fetch
::gignore::git update-index --assume-unchanged
::gunignore::git update-index --no-assume-unchanged
::gmnff::git merge --no-ff -e -m "" -
::-h::--help

::gcm::git commit -m "
::gcaem::git commit --allow-empty -m "
::gaa::git add -A
::gchb::git checkout -b 