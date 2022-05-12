#!/bin/bash

echo
# Setting up pacakage manager
package_set=""
while [ "$package_set" == "" ]
do
echo -e "package manager npm/yarn : \c"
read -r package
if [ $package == yarn ]; then
package_set="add"
elif [ $package == npm ]; then
package_set="install"
else
package_set=""
fi
done

# Project creation
echo -e "project name: \c"
read -r name

expo init $name --$package

# Dependencies installation
$package $package_set @react-navigation/native
expo install react-native-screens react-native-safe-area-context

expo install expo-font
