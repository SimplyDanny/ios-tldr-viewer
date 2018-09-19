//
// Autogenerated by Laurine - by Jiri Trecak ( http://jiritrecak.com, @jiritrecak )
// Do not change this file manually!
//


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Imports

import Foundation


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - Localizations


public struct Localizations {


    public struct CommandDetail {

        /// Base translation: Copied to pasteboard
        public static var CopiedToPasteboard : String = NSLocalizedString("COMMAND_DETAIL.COPIED_TO_PASTEBOARD", comment: "")

        /// Base translation: Nothing selected
        public static var NothingSelected : String = NSLocalizedString("COMMAND_DETAIL.NOTHING_SELECTED", comment: "")

        /// Base translation: See also:
        public static var SeeAlso : String = NSLocalizedString("COMMAND_DETAIL.SEE_ALSO", comment: "")


        public struct Error {

            /// Base translation: Could not find tl;dr
            public static var CouldNotFindTldr : String = NSLocalizedString("COMMAND_DETAIL.ERROR.COULD_NOT_FIND_TLDR", comment: "")

        }
    }

    public struct Info {


        public struct Author {

            /// Base translation: © %@ Green Light Apps
            public static func Detail(_ value1 : String) -> String {
                return String(format: NSLocalizedString("INFO.AUTHOR.DETAIL", comment: ""), value1)
            }

            /// Base translation: Author
            public static var Title : String = NSLocalizedString("INFO.AUTHOR.TITLE", comment: "")

        }

        public struct Version {

            /// Base translation: Version
            public static var Title : String = NSLocalizedString("INFO.VERSION.TITLE", comment: "")

            /// Base translation: %@
            public static func Detail(_ value1 : String) -> String {
                return String(format: NSLocalizedString("INFO.VERSION.DETAIL", comment: ""), value1)
            }

        }

        public struct Thanks {

            /// Base translation: Thanks to
            public static var Header : String = NSLocalizedString("INFO.THANKS.HEADER", comment: "")


            public struct _3 {

                /// Base translation: 'Arabidopsis' for the gorgeous teal-deer artwork, found on DeviantArt. It's available on a shirt via Redbubble. (All profits go to the artist)
                public static var Message : String = NSLocalizedString("INFO.THANKS.3.MESSAGE", comment: "")


                public struct LinkAnchor {

                    /// Base translation: DeviantArt
                    public static var Deviantart : String = NSLocalizedString("INFO.THANKS.3.LINK_ANCHOR.DEVIANTART", comment: "")

                    /// Base translation: Redbubble
                    public static var Redbubble : String = NSLocalizedString("INFO.THANKS.3.LINK_ANCHOR.REDBUBBLE", comment: "")

                }
            }

            public struct _1 {

                /// Base translation: Romain Prieto and all other contributors to tldr-pages.
                public static var Message : String = NSLocalizedString("INFO.THANKS.1.MESSAGE", comment: "")

                /// Base translation: tldr-pages
                public static var LinkAnchor : String = NSLocalizedString("INFO.THANKS.1.LINK_ANCHOR", comment: "")

            }

            public struct _2 {

                /// Base translation: Kristopher Johnson for Markingbird, a Markdown processor in Swift.
                public static var Message : String = NSLocalizedString("INFO.THANKS.2.MESSAGE", comment: "")

                /// Base translation: Markingbird
                public static var LinkAnchor : String = NSLocalizedString("INFO.THANKS.2.LINK_ANCHOR", comment: "")

            }
        }

        public struct OpenSource {

            /// Base translation: Open Source app
            public static var Header : String = NSLocalizedString("INFO.OPEN_SOURCE.HEADER", comment: "")

            /// Base translation: Fork me on GitHub!
            public static var Message : String = NSLocalizedString("INFO.OPEN_SOURCE.MESSAGE", comment: "")

            /// Base translation: Fork me
            public static var LinkAnchor : String = NSLocalizedString("INFO.OPEN_SOURCE.LINK_ANCHOR", comment: "")

        }

        public struct About {

            /// Base translation: An iOS client for tldr-pages - simplified and community-driven man pages.
            public static var Message : String = NSLocalizedString("INFO.ABOUT.MESSAGE", comment: "")

            /// Base translation: About
            public static var Header : String = NSLocalizedString("INFO.ABOUT.HEADER", comment: "")

            /// Base translation: tldr-pages
            public static var LinkAnchor : String = NSLocalizedString("INFO.ABOUT.LINK_ANCHOR", comment: "")

        }

        public struct BugReports {

            /// Base translation: Bug reports, requests, pull requests welcome at the GitHub Issues page.
            public static var Message : String = NSLocalizedString("INFO.BUG_REPORTS.MESSAGE", comment: "")

            /// Base translation: GitHub Issues
            public static var LinkAnchor : String = NSLocalizedString("INFO.BUG_REPORTS.LINK_ANCHOR", comment: "")

        }

        public struct Contact {

            /// Base translation: Contact via email or Twitter.
            public static var Message : String = NSLocalizedString("INFO.CONTACT.MESSAGE", comment: "")

            /// Base translation: Contact
            public static var Header : String = NSLocalizedString("INFO.CONTACT.HEADER", comment: "")


            public struct Twitter {

                /// Base translation: Twitter
                public static var LinkAnchor : String = NSLocalizedString("INFO.CONTACT.TWITTER.LINK_ANCHOR", comment: "")

            }

            public struct Email {

                /// Base translation: email
                public static var LinkAnchor : String = NSLocalizedString("INFO.CONTACT.EMAIL.LINK_ANCHOR", comment: "")

            }
        }
    }

    public struct CommandList {


        public struct Favourites {

            /// Base translation: No favourites yet!  Tap the ♡ button to favourite a command.
            public static var None : String = NSLocalizedString("COMMAND_LIST.FAVOURITES.NONE", comment: "")

        }

        public struct Search {


            public struct NothingFound {

                /// Base translation: tldr
                public static var ForHighlight : String = NSLocalizedString("COMMAND_LIST.SEARCH.NOTHING_FOUND.FOR_HIGHLIGHT", comment: "")

                /// Base translation: Nothing found for '%@'.  tldr is a community effort, and replies on people like you to contribute content. 
                public static func For(_ value1 : String) -> String {
                    return String(format: NSLocalizedString("COMMAND_LIST.SEARCH.NOTHING_FOUND.FOR", comment: ""), value1)
                }

                /// Base translation: Contribute new content
                public static var ContributeContent : String = NSLocalizedString("COMMAND_LIST.SEARCH.NOTHING_FOUND.CONTRIBUTE_CONTENT", comment: "")

            }
        }

        public struct AllCommands {

            /// Base translation: Updated %@
            public static func UpdatedDateTime(_ value1 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.ALL_COMMANDS.UPDATED_DATE_TIME", comment: ""), value1)
            }

            /// Base translation: Search Commands
            public static var SearchPlaceholder : String = NSLocalizedString("COMMAND_LIST.ALL_COMMANDS.SEARCH_PLACEHOLDER", comment: "")

        }

        public struct CommandPlatforms {

            /// Base translation: %@, %@
            public static func Two(_ value1 : String, _ value2 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.TWO", comment: ""), value1, value2)
            }

            /// Base translation: %@, %@, %@, %@
            public static func Four(_ value1 : String, _ value2 : String, _ value3 : String, _ value4 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.FOUR", comment: ""), value1, value2, value3, value4)
            }

            /// Base translation: %@, %@, %@, %@, %@, %@
            public static func Six(_ value1 : String, _ value2 : String, _ value3 : String, _ value4 : String, _ value5 : String, _ value6 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.SIX", comment: ""), value1, value2, value3, value4, value5, value6)
            }

            /// Base translation: %@, %@, %@, %@, %@
            public static func Five(_ value1 : String, _ value2 : String, _ value3 : String, _ value4 : String, _ value5 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.FIVE", comment: ""), value1, value2, value3, value4, value5)
            }

            /// Base translation: %@
            public static func One(_ value1 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.ONE", comment: ""), value1)
            }

            /// Base translation: %@, %@, %@
            public static func Three(_ value1 : String, _ value2 : String, _ value3 : String) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORMS.THREE", comment: ""), value1, value2, value3)
            }

        }

        public struct IndexOld {

            /// Base translation: Update index now
            public static var UpdateNow : String = NSLocalizedString("COMMAND_LIST.INDEX_OLD.UPDATE_NOW", comment: "")

            /// Base translation: The index is %d days old.
            public static func NumberOfDays(_ value1 : Int) -> String {
                return String(format: NSLocalizedString("COMMAND_LIST.INDEX_OLD.NUMBER_OF_DAYS", comment: ""), value1)
            }

        }

        public struct Error {

            /// Base translation: Could not the read index file
            public static var CouldNotReadIndexFile : String = NSLocalizedString("COMMAND_LIST.ERROR.COULD_NOT_READ_INDEX_FILE", comment: "")

            /// Base translation: Could not save the download
            public static var CouldNotSaveDownload : String = NSLocalizedString("COMMAND_LIST.ERROR.COULD_NOT_SAVE_DOWNLOAD", comment: "")

            /// Base translation: Could not unzip the download
            public static var CouldNotUnzipDownload : String = NSLocalizedString("COMMAND_LIST.ERROR.COULD_NOT_UNZIP_DOWNLOAD", comment: "")

            /// Base translation: Try again
            public static var TryAgain : String = NSLocalizedString("COMMAND_LIST.ERROR.TRY_AGAIN", comment: "")

            /// Base translation: Could not download tl;dr file
            public static var CouldNotDownload : String = NSLocalizedString("COMMAND_LIST.ERROR.COULD_NOT_DOWNLOAD", comment: "")

        }

        public struct DataSources {

            /// Base translation: All
            public static var All : String = NSLocalizedString("COMMAND_LIST.DATA_SOURCES.ALL", comment: "")

            /// Base translation: Favourites
            public static var Favourites : String = NSLocalizedString("COMMAND_LIST.DATA_SOURCES.FAVOURITES", comment: "")

        }

        public struct CommandPlatform {

            /// Base translation: Linux
            public static var Linux : String = NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORM.LINUX", comment: "")

            /// Base translation: Solaris
            public static var Solaris : String = NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORM.SOLARIS", comment: "")

            /// Base translation: Windows
            public static var Windows : String = NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORM.WINDOWS", comment: "")

            /// Base translation: macOS
            public static var Osx : String = NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORM.OSX", comment: "")

            /// Base translation: Common
            public static var Common : String = NSLocalizedString("COMMAND_LIST.COMMAND_PLATFORM.COMMON", comment: "")

        }
    }
}