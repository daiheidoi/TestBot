import os
import sys
import watcher
from watcher import FileSystemWatcher

watch = FileSystemWatcher()
#watch.Path = sys.argv[1]
watch.Path = '/Users/daihei.doi/Desktop/md_files'
watch.Filter = '*.md';

from FileSystemWatcher.NotifyFilters import LastAccess, FileName, DirectoryName, LastWrite
watch.NotifyFilter = LastAccess | FileName | DirectoryName | LastWrite
watch.IncludeSubdirectories = False

from FileSystemWatcher.WatcherChangeTypes import All

changedResult = watch.WaitForChanged(All,60000)

#if changedResult.TimedOut :

from FileSystemWatcher.WatcherChangeTypes import All

if changedResult.ChangeType == Created :
	os.system('python ~/Desktop/Bayashin/slack_pythons/slack_test_post.py a b')

if changedResult.ChangeType == Changed :
	os.system('python ~/Desktop/Bayashin/slack_pythons/slack_test_post.py c d' )

if changedResult.ChangeType == Renamed :
	os.system('python ~/Desktop/Bayashin/slack_pythons/slack_test_post.py e f' )

if changedResult.ChangeType == Deleted :
	os.system('python ~/Desktop/Bayashin/slack_pythons/slack_test_post.py g h' )

raw_input()
