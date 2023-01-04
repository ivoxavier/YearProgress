/*
 * 2015 Johan Guerreros
 * 2022 Ivo Xavier 
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * kaltracker is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Lomiri.Components.ListItems 1.3 
import Lomiri.Components.Popups 1.3
import QtQuick.Controls.Suru 2.2

  
Canvas {
    id: canvas
        
    width: units.gu(20)
    height: units.gu(20)
    antialiasing: true
    
    //adaptive animation duration
    readonly property int animation_duration: root.complete_percentage <= 29 ? 
    1000 : root.complete_percentage >= 30 && root.complete_percentage <= 59  ? 
    2000 : root.complete_percentage >= 60 && root.complete_percentage <= 89 ?
    3000 : 3000

    property color primaryColor: "#434237" //black
    property color secondaryColor: "#F60D0D" //red

    property real centerWidth: width / 2
    property real centerHeight: height / 2
   
    property real radius: units.gu(8)

    property real minimumValue: 0
    property real maximumValue: 100
    property real currentValue: root.complete_percentage

    SequentialAnimation on currentValue {
        NumberAnimation {
            from: 0
            to: canvas.currentValue
            duration: animation_duration
        } 
    }

    

    // this is the angle that splits the circle in two arcs
    // first arc is drawn from 0 radians to angle radians
    // second arc is angle radians to 2*PI radians
    property real angle: (currentValue - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI

    // we want both circle to start / end at 12 o'clock
    // without this offset we would start / end at 9 o'clock
    property real angleOffset: -Math.PI / 2


    onPrimaryColorChanged: requestPaint()
    onSecondaryColorChanged: requestPaint()
    onMinimumValueChanged: requestPaint()
    onMaximumValueChanged: requestPaint()
    onCurrentValueChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.save();

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // First, thinner arc
        // From angle to 2*PI

        ctx.beginPath();
        ctx.lineWidth = units.gu(0.5);
        ctx.strokeStyle = primaryColor;
        ctx.arc(canvas.centerWidth,
        canvas.centerHeight,
        canvas.radius,
        angleOffset + canvas.angle,
        angleOffset + 2*Math.PI);
        ctx.stroke();

         // Second, thicker arc
        // From 0 to angle

        ctx.beginPath();
        ctx.lineWidth = units.gu(0.5);
        ctx.strokeStyle = canvas.secondaryColor;
        ctx.arc(canvas.centerWidth,
        canvas.centerHeight,
        canvas.radius,
        canvas.angleOffset,
        canvas.angleOffset + canvas.angle);
        ctx.stroke();
        ctx.restore();
    }

    ColumnLayout{
        anchors.centerIn: parent
        width: parent.width / 2
        RowLayout{
            Layout.alignment: Qt.AlignHCenter
            Label{
                id: percentage_label
                property int value_percentage : root.complete_percentage
                Layout.alignment: Qt.AlignCenter
                text: value_percentage.toString()
                color: "#F60D0D"
                font.pixelSize: value_percentage == 100 ? units.gu(4.5) : units.gu(5.5)
                font.bold: true

                SequentialAnimation on value_percentage {
                    NumberAnimation {
                        from: 0
                        to: percentage_label.value_percentage
                        duration: animation_duration
                    } 
                }
            }
            Label{
                text:"%"
                font.pixelSize: units.gu(2.5)
                font.bold: true
                color: "#F60D0D"
            }
        }
    }
} 
