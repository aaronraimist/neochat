/**
 * SPDX-FileCopyrightText: 2020 Tobias Fella <fella@posteo.de>
 *
 * SPDX-License-Identifier: GPL-3.0-only
 */

import QtQuick 2.15
import QtQuick.Controls 2.12 as QQC2
import QtQuick.Layouts 1.12

import org.kde.kirigami 2.12 as Kirigami

import org.kde.neochat 1.0
import NeoChat.Component 1.0


LoginStep {
    id: root

    title: i18nc("@title", "Password")
    showContinueButton: true
    showBackButton: true
    previousUrl: LoginHelper.supportsSso ? "qrc:/imports/NeoChat/Component/Login/LoginMethod.qml" : "qrc:/imports/NeoChat/Component/Login/Login.qml"

    action: Kirigami.Action {
        text: i18nc("@action:button", "Login")
        enabled: passwordField.text.length > 0
        onTriggered: {
            LoginHelper.login();
        }
    }

    Connections {
        target: LoginHelper
        function onConnected() {
            processed("qrc:/imports/NeoChat/Component/Login/Loading.qml")
        }
    }

    Kirigami.FormLayout {
        Kirigami.PasswordField {
            id: passwordField
            onTextChanged: LoginHelper.password = text
        }
    }
}
