/*
 * \copyright Copyright (c) 2016-2020 Governikus GmbH & Co. KG, Germany
 */

import QtQuick 2.10

import Governikus.Global 1.0
import Governikus.TitleBar 1.0
import Governikus.View 1.0
import Governikus.Type.ApplicationModel 1.0
import Governikus.Type.SettingsModel 1.0


SectionPage
{
	id: root
	navigationAction: NavigationAction { state: "back"; onClicked: firePop() }
	//: LABEL ANDROID IOS
	title: qsTr("Version Information") + SettingsModel.translationTrigger

	content: Item
	{
		height: pane.height + 2 * Constants.component_spacing
		width: root.width

		Column
		{
			id: column

			anchors.fill: parent
			anchors.margins: Constants.component_spacing

			Pane {
				id: pane

				Repeater {
					model: versionInformationModel

					LabeledText {
						id: delegate

						anchors.left: parent.left
						anchors.right: parent.right

						label: model.label
						text: model.text
					}
				}
			}
		}

		MouseArea {
			property int advancedSettingsCounter: 0

			anchors.fill: column

			onClicked: {
				advancedSettingsCounter += 1

				switch (advancedSettingsCounter) {
					case 7:
					case 8:
					case 9:
						//: INFO ANDROID IOS Used in notifications when the user taps the version information
						ApplicationModel.showFeedback(qsTr("%1 more presses to toggle the advanced settings.").arg(10 - advancedSettingsCounter), true)
						break;
					case 10:
						SettingsModel.advancedSettings = !SettingsModel.advancedSettings
						ApplicationModel.showFeedback(
							SettingsModel.advancedSettings ?
							//: LABEL ANDROID IOS
							qsTr("Advanced settings activated.") :
							//: LABEL ANDROID IOS
							qsTr("Advanced settings deactivated.")
						)
						advancedSettingsCounter = 0
						break;
				}
			}
		}
	}
}
