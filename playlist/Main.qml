import QtQuick 2.4
import Ubuntu.Components 1.3
import QtMultimedia 5.6

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "playlist.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    Page {
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("playlist")
        }

        Audio {
            id: player;
            playlist: Playlist {
                id: playlist
                PlaylistItem { source: "bubblepop.mp3"; }
//                PlaylistItem { source: "nice.mp3"; }
//                PlaylistItem { source: "bubblepop.mp3"; }
//                PlaylistItem { source: "sounds/bubblepop.mp3"; }
//                PlaylistItem { source: "sounds/bubblepop.mp3"; }
//                PlaylistItem { source: "sounds/bubblepop.wav"; }
            }

            Component.onCompleted: {
                console.log("playlist count: " + playlist.itemCount)
            }
        }

        ListView {
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: pageHeader.bottom
            }

            model: playlist;
            delegate: Label {
                fontSize: "large"
                text: source;
            }
        }

        MouseArea {
            anchors.fill: parent;
            onPressed: {
                if (player.playbackState != Audio.PlayingState) {
                    player.play();
                } else {
                    player.pause();
                }
            }
        }
    }
}

