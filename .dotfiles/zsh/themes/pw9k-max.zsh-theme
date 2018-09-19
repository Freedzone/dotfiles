# vim:ft=zsh foldmethod=marker

ZSH_THEME="powerlevel9k/powerlevel9k"

# powerlevel9k customization
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time ram virtualenv rbenv rvm)

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="\ue0b3"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=""

POWERLEVEL9K_HOST_ICON="\uF109" # <U+F109>
POWERLEVEL9K_TIME_FORMAT="\uf017 %T  \uf073 %D{%d %b %y}"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='236'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='208'
POWERLEVEL9K_CONTEXT_ICON='\uf109' # <U+F109>

POWERLEVEL9K_STATUS_OK_BACKGROUND="235"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="235"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="235"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="235"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="magenta"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_ICON="\u231A"