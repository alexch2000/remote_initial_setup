#!/bin/bash

# File path
ZSHRC_PATH="~/.zshrc"

# 1. Add JAVA_HOME
grep -q "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" "$ZSHRC_PATH" || echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> "$ZSHRC_PATH"

# 2. Update PATH
sed -i 's#export PATH=$HOME/bin:/usr/local/bin:$PATH#export PATH=$JAVA_HOME/bin:$PATH#g' "$ZSHRC_PATH"

# 3. Change ZSH_THEME
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="gentoo"/g' "$ZSHRC_PATH"

# 4. Enable autocorrection
sed -i 's/# ENABLE_CORRECTION="true"/ENABLE_CORRECTION="true"/g' "$ZSHRC_PATH"

echo "Modifications applied to $ZSHRC_PATH"
