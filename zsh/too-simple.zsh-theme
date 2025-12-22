local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  # PR_PROMPT='%B%F{magenta}%f%b'
  PR_PROMPT='%B%F{magenta}>%f%b'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  # PR_PROMPT='%B%F{red}%f%b'
  PR_PROMPT='%B%F{red}$%f%b'
fi

# check if we are on ssh or not
if [[ -n "$ssh_client"  ||  -n "$ssh2_client" ]]; then
  pr_host='%f{red}%m%f' # ssh
else
  pr_host='%f{green}%m%f' # no ssh
fi

local return_code="%(?..%F{red}%? ↵%f)"

# parse_git_branch() {
#     branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
#     if [[ -n "$branch" ]]; then
#         echo "($branch)"
#     fi
# }

# local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local user_host="${PR_USER}"
local current_dir="%B%F{green}%1~%f%b"
local git_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)' 
local time_stamp='%F{yellow}%T%f'

PROMPT="${venv_prompt}${current_dir} ${git_branch}$PR_PROMPT "
# RPROMPT="${return_code} ${time_stamp}"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{cyan}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_VIRTUALENV_PREFIX="%F{red}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%f "
