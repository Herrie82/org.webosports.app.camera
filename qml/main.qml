/*
 * Copyright (C) 2016 Herman van Hazendonk <github.com@herrie.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import QtQuick 2.0
import QtMultimedia 5.6
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
//import LunaNext.Common 0.1

Window {
    id: root
    width: 800
    height: 600
	
	Component.onCompleted:
    {
        root.visible = true
	}

    Rectangle
    {
        anchors.fill: parent
        color: "lightblue"

        Camera {
            id: camera
        }

        VideoOutput {
            anchors.fill: parent
            source: camera
        }

        ListView {
            anchors.fill: parent

            model: QtMultimedia.availableCameras
            delegate: Text {
                text: modelData.displayName

                MouseArea {
                    anchors.fill: parent
                    onClicked: camera.deviceId = modelData.deviceId
                }
            }
        }
    }
}
