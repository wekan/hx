haxelib list | grep '\[git\]' | awk '{print $1}' | cut -d: -f1 | while read LIB_NAME; do
    INFO_OUTPUT=$(haxelib info "$LIB_NAME" 2>/dev/null)
    REPO_URL=$(echo "$INFO_OUTPUT" | grep "^Website:" | sed -E 's/^Website:\s*//' | xargs)
    if echo "$REPO_URL" | grep -qE "(github.com|gitlab.com|bitbucket.org|git@|ssh://)"; then
        echo "Library: $LIB_NAME"
        echo "Repo URL: $REPO_URL"
        echo "---"
    fi
done
