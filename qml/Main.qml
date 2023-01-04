/*
 * Copyright (C) 2022  Ivo Xavier
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

import QtQuick 2.9
import Lomiri.Components 1.3
import QtQuick.Controls 2.2 as QQC2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'yearprogress.ivoxavier'
    automaticOrientation: true

    property var locale: Qt.locale()
    property date currentDate: new Date()
    property var weekNumber: currentDate.weekNumber
    property var stringDate: currentDate.toLocaleDateString(locale, 'yyyy-MM-dd')
    property var year : currentDate.toLocaleDateString(locale, 'yyyy')
    property var first_date_of_year : currentDate.toLocaleDateString(locale, year + '-01-01')
    property var today_date : new Date(stringDate)
    property var year_start : new Date(first_date_of_year)
    property var dif_time: Math.abs(today_date - year_start)
    property var dif_days: Math.ceil(dif_time / (1000 * 60 * 60 * 24)) + 1
    property var complete_percentage: Math.round(Math.round((dif_days / 365 * 100) * 10) / 10)

    width: units.gu(45)
    height: units.gu(75)
    backgroundColor: "black"
    
    Page {
        id: parent_page
        anchors.fill: parent
        header: PageHeader {visible: false}

        QQC2.SwipeView{  
            id: view
            currentIndex: 0
            anchors.top: root.top
            anchors.bottom: root.bottom
            width: parent.width
            height: parent.height

            Item{
                //index 0
                Percentage{anchors.centerIn:parent;}
            }

            Item{
                //index 1
                Days{anchors.centerIn:parent}
            }

        }
        QQC2.PageIndicator{
            id: indicator
            count: view.count
            currentIndex: view.currentIndex
            anchors.bottom: parent_page.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
