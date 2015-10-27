for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
ln -sf "/usr/share/doc/git/contrib/diff-highlight/diff-highlight" ~/bin/diff-highlight

