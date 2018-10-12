cat acc | egrep -o "COMP[0-9]{4}_Student" | sed -r "s/_Student//g"

