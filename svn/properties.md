# available svn cli options

* svn propdel
* svn propedit
* svn propget
* svn proplist
* svn propset

# list of properties

## versioned properties

* svn:executable - If present on a file, the client will make the file executable in Unix-hosted working copies. See the section called “File Executability”.
* svn:mime-type - If present on a file, the value indicates the file's MIME type. This allows the client to decide whether line-based contextual merging is safe to perform during updates, and can also affect how the file behaves when fetched via a web browser. See the section called “File Content Type”.
* svn:ignore - If present on a directory, the value is a list of unversioned file patterns to be ignored by svn status and other subcommands. See the section called “Ignoring Unversioned Items”.
* svn:keywords - If present on a file, the value tells the client how to expand particular keywords within the file. See the section called “Keyword Substitution”.
* svn:eol-style - If present on a file, the value tells the client how to manipulate the file's line-endings in the working copy and in exported trees. See the section called “End-of-Line Character Sequences” and svn export earlier in this chapter.
* svn:externals - If present on a directory, the value is a multiline list of other paths and URLs the client should check out. See the section called “Externals Definitions”.
* svn:special - If present on a file, indicates that the file is not an ordinary file, but a symbolic link or other special object.[72]
* svn:needs-lock - If present on a file, tells the client to make the file read-only in the working copy, as a reminder that the file should be locked before editing begins. See the section called “Lock Communication”.
* svn:mergeinfo - Used by Subversion to track merge data. See the section called “Mergeinfo and Previews” for details, but you should never edit this property unless you really know what you're doing.

## unversioned properties

* svn:author - If present, contains the authenticated username of the person who created the revision. (If not present, the revision was committed anonymously.)
* svn:autoversioned - If present, the revision was created via the autoversioning feature. See the section called “Autoversioning”.
* svn:date - Contains the UTC time the revision was created, in ISO 8601 format. The value comes from the server machine's clock, not the client's.
* svn:log - Contains the log message describing the revision.
* svn:rdump-lock - Used to temporarily enforce mutually exclusive access to the repository by svnrdump load. This property is generally only observed when such an operation is active—or when an svnrdump command failed to cleanly disconnect from the repository. (This property is only relevant when it appears on revision 0.)
* svn:sync-currently-copying - Contains the revision number from the source repository which is currently being mirrored to this one by the svnsync tool. (This property is only relevant when it appears on revision 0.)
* svn:sync-from-uuid - Contains the UUID of the repository of which this repository has been initialized as a mirror by the svnsync tool. (This property is only relevant when it appears on revision 0.)
* svn:sync-from-url - Contains the URL of the repository directory of which this repository has been initialized as a mirror by the svnsync tool. (This property is only relevant when it appears on revision 0.)
* svn:sync-last-merged-rev - Contains the revision of the source repository which was most recently and successfully mirrored to this one. (This property is only relevant when it appears on revision 0.)
* svn:sync-lock - Used to temporarily enforce mutually exclusive access to the repository by svnsync mirroring operations. This property is generally only observed when such an operation is active—or when an svnsync command failed to cleanly disconnect from the repository. (This property is only relevant when it appears on revision 0.)

# links

* http://svnbook.red-bean.com/en/1.7/svn.ref.properties.html
* https://www.mediawiki.org/wiki/Subversion/auto-props
