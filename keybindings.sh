# go up a dir with ctrl-k
function up_widget() {
	BUFFER="cd .."
	zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# ctrl-v to open last command in vim buffer
function edit_and_run() {
	BUFFER="fc"
	zle accept-line
}
zle -N edit_and_run
bindkey "^v" edit_and_run
