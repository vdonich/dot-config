#!/bin/sh
pushd ~/Documents/tasks > /dev/null
if grep -q '<<<<<' ./work.txt ; then
    echo Conflict unresolved!
    exit 1
fi

michel-orgmode --pull --orgfile work.txt.upstream --listname work > /dev/null 2>&1
if [ $? -ne "0" ] ; then
    echo Pull error!
    popd > /dev/null
    exit 1
fi
sed -i '' '/^\* $/d' ./work.txt.upstream
if git merge-file --diff3 ./work.txt ./work.txt.orig ./work.txt.upstream ; then
    rm ./work.txt.upstream
    cp ./work.txt ./work.txt.orig
    michel-orgmode --push --orgfile work.txt --listname work > /dev/null 2>&1
    echo Sync complete
else
    echo Sync conflict
fi

popd > /dev/null
