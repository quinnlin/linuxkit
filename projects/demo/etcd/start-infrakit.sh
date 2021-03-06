# !/bin/sh

# Start the infrakit plugins, save their PID

INFRAKIT_HOME=~/.infrakit
IK_PLUGINS=$INFRAKIT_HOME/plugins

rm -rf $INFRAKIT_HOME
mkdir -p $INFRAKIT_HOME/cli

infrakit-flavor-vanilla &
infrakit-instance-hyperkit &
infrakit-instance-gcp --project docker4x --zone europe-west1-d &

# start the group plugin in the foreground. If it exits, it will take
# the others down as well.
infrakit-group-default

rm -rf $INFRAKIT_HOME
