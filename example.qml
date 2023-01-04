/*
 * Copyright (C) 2022 - Ed Beroset <beroset@ieee.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * This is a simple QML example to show how to use asteroid-virtualkeyboard
 */

import QtQuick 2.9
import org.asteroid.controls 1.0
import org.asteroid.utils 1.0
import QtQuick.VirtualKeyboard 2.1
import QtQuick.VirtualKeyboard.Settings 2.15

Item {
    id: root
    property var selected


    Component.onCompleted: {
        VirtualKeyboardSettings.styleName = "watch"
        VirtualKeyboardSettings.fullScreenMode = true
    }

    Flickable {
        anchors.fill: parent
        contentHeight: mycol.implicitHeight
        boundsBehavior: Flickable.DragOverBounds
        flickableDirection: Flickable.HorizontalAndVerticalFlick

        Column {
            id: mycol
            anchors {
                fill: parent
                margins: Dims.l(15)
            }

            TextField {
                id: locationName
                width: parent.width
                //% "Location Name"
                previewText: qsTrId("id-location-name-field")
            }

            TextField {
                id: latfield
                width: parent.width
                //% "Location Latitude"
                previewText: qsTrId("id-latitude-field")
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }

            TextField {
                id: lonfield
                width: parent.width
                //% "Location Longitude"
                previewText: qsTrId("id-longitude-field")
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }
            IconButton {
                id: acceptButton
                anchors.horizontalCenter: parent.horizontalCenter
                iconName: "ios-add-circle-outline"
                onClicked: {
                    selected(locationName.text, parseFloat(latfield.text), parseFloat(lonfield.text))
                }
            }
        }
    }
    InputPanel {
        id: kbd
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            margins: Dims.w(15)
        }
        width: Dims.w(85)
        visible: active
    }
}
