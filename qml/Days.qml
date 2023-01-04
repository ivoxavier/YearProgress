/*
 * Copyright (C) 2022-2023  Ivo Xavier <ivofernandes12@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * yearprogress is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Controls 2.2 as QQC2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0


ColumnLayout{
    width: parent.width
    
    Label{Layout.alignment: Qt.AlignHCenter;text: i18n.tr("Current Date");font.pixelSize: units.gu(2.5);color: "#F60D0D"}
    Label{Layout.alignment: Qt.AlignHCenter;text: root.stringDate;font.pixelSize: units.gu(2.5)}
    BlankSpace{height: units.gu(2)}
    Label{Layout.alignment: Qt.AlignHCenter;text: i18n.tr("Days Passed");font.pixelSize: units.gu(2.5);color: "#F60D0D"}
    RowLayout{
    Layout.alignment: Qt.AlignHCenter
    Label{text: root.dif_days;font.pixelSize: units.gu(5.5);font.bold: true;color: "#F60D0D"} 
    Label{text:"/"}
    Label{text:"365"}
    }
}
