# Tmux Cheatsheet

tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.

When tmux is started it creates a new session with a single window and displays it on screen. A status line at the bottom of the screen shows information on the current session and is used to enter interactive commands.

A session is a single collection of pseudo terminals under the management of tmux. Each session has one or more windows linked to it. A window occupies the entire screen and may be split into rectangular panes, each of which is a separate pseudo terminal (the pty(4) manual page documents the technical details of pseudo terminals). Any number of tmux instances may connect to the same session, and any number of windows may be present in the same session. Once all sessions are killed, tmux exits.

Each session is persistent and will survive accidental disconnection (such as ssh(1) connection timeout) or intentional detaching (with the ‘C-b d’ key strokes). tmux may be reattached using:

```
$ tmux attach
```

In tmux, a session is displayed on screen by a client and all sessions are managed by a single server. The server and each client are separate processes which communicate through a socket in /tmp.

## Installation

*Debian type distro*
```
$ sudo apt-get install tmux
```

*MacOs*
```
$ brew install tmux
```
## Panes control

| Function | Command |
| --- | --- |
| split window vertically | c-b % |
| split window horizontally | c-b " |
| next pane | c-b o |
| previous pane | c-b ; |
| swap to previous active pane | c-b ; |
| show pane numbers | c-b q |
| swap current pane position with previons pane | c-b { |
| swap current pane position with next pane | c-b } |
| swap panes locations clockwise | c-b c-o |
| toggle pane zoom | c-b z |
| toggle between panes layouts | c-b [space] |
| close current pane | exit or c-b x |

## Window control

| Function | Command |
| --- | --- |
| new window | c-b c |
| close window | c-b x ou c-d |
| kill window | c-b & |
| lsit all windows | c-b w |
| next window | c-b n |
| previous window | c-b p |
| rename window | c-b , |
| list all window | c-b w |
| move to window number | c-b [number] |

## Resizing panes

| Function | Command |
| --- | --- |
| resize pane down | c-b c-down |
| resize pane up | c-b c-up |
| resize pane left | c-b c-[<=] |
| resize pane right | c-b c-[=>] |

## Session control 

| Function | Command |
| --- | --- |
| close session | c-b c-z |
| kill session | tmux kill-session -t [name] |
| open new session with name | tmux new -s [name] |
| detach session | c-b d |
| list all sessions | tmux ls |
| re-attach last session | tmux attach |
| re-attach session by name | tmux attach -t [name] |
| rename current session | c-b $ |

## utilities

| Function | Command |
| --- | --- |
| show time | c-b t |
 or c-b x
