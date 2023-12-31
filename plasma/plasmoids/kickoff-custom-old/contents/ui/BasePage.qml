/*
    SPDX-FileCopyrightText: 2011 Martin Gräßlin <mgraesslin@kde.org>
    SPDX-FileCopyrightText: 2012 Marco Martin <mart@kde.org>
    SPDX-FileCopyrightText: 2015-2018 Eike Hein <hein@kde.org>
    SPDX-FileCopyrightText: 2021 Mikel Johnson <mikel5764@gmail.com>
    SPDX-FileCopyrightText: 2021 Noah Davis <noahadvs@gmail.com>

    SPDX-License-Identifier: GPL-2.0-or-later
*/
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Templates 2.15 as T
import QtQml 2.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PC3
import org.kde.plasma.private.kicker 0.1 as Kicker
import org.kde.plasma.workspace.trianglemousefilter 1.0

FocusScope {
    id: root

    property alias contentAreaComponent: contentAreaLoader.sourceComponent
    property alias contentAreaItem: contentAreaLoader.item

    Loader {
        id: contentAreaLoader
        focus: true
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        // Tab should go to the start of the footer focus chain
        KeyNavigation.tab: plasmoid.rootItem.footer.nextItemInFocusChain()
        Keys.onUpPressed: plasmoid.rootItem.searchField.forceActiveFocus(Qt.BacktabFocusReason)
        Keys.onDownPressed: plasmoid.rootItem.footer.leaveButtons.nextItemInFocusChain().forceActiveFocus(Qt.TabFocusReason)
    }
}
