/*
 * 2022  Ivo Xavier  
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * Year Progress is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Controls 2.2 as QQC2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

QQC2.ProgressBar {
    id: bar
    Layout.alignment: Qt.AlignHCenter
    
    //public api
    property alias percentage : bar.value
    property alias bar_color : inner_bar.color

    SequentialAnimation on value {
        NumberAnimation {
            from: 0.0
            to: percentage
            duration: lomiri_shape.animation_duration
        } 
    }

    padding: 2
    background: Rectangle {
        implicitWidth: units.gu(5.5)
        implicitHeight: units.gu(3.5)
        color: "black"
        radius: 10
        border.color : "#F60D0D"
    }

    contentItem: Item {
        implicitWidth: units.gu(30)
        implicitHeight: units.gu(5)
        Rectangle {
            id: inner_bar
            width: bar.visualPosition * parent.width
            height: parent.height
            radius: 7
            color: "#17a81a"
        }
    }
}