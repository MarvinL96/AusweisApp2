/*
 * \copyright Copyright (c) 2016-2020 Governikus GmbH & Co. KG, Germany
 */

import QtQuick 2.10

import Governikus.Global 1.0
import Governikus.Style 1.0
import Governikus.Type.SettingsModel 1.0


Column {
	id: baseItem
	spacing: Constants.pane_spacing

	signal scrollDescriptionUp()
	signal scrollDescriptionDown()

	property string description: ""

	GText {
		Accessible.role: Accessible.StaticText
		Accessible.name: text

		//: LABEL ANDROID_TABLET IOS_TABLET
		text: qsTr("Description") + SettingsModel.translationTrigger
		textStyle: Style.text.header_accent
	}

	GText {
		width: parent.width

		Accessible.role: Accessible.StaticText
		Accessible.name: text
		Accessible.onScrollDownAction: baseItem.scrollDescriptionDown()
		Accessible.onScrollUpAction: baseItem.scrollDescriptionUp()

		horizontalAlignment: Text.AlignLeft
		text: baseItem.description
		textStyle: Style.text.normal_secondary
	}
}
