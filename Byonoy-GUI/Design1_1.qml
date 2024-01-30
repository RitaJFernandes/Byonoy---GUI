import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import QtCore

GridLayout{
    width: parent.width *0.4
    height: parent.height *0.6
    columns: 2
    columnSpacing: 20

    function validateValues() {
        // pwm
        warningPwmLabel.visible = !setGainPwm.acceptableInput;
        warningPwmStepLabel.visible = !setPwmStepSize.acceptableInput;

        // dac
        warningDacLabel.visible = !setGainDac.acceptableInput;
        warningDacStepLabel.visible = !setDacStepSize.acceptableInput;

        // if all are valid change the values
        if (setGainPwm.acceptableInput && setPwmStepSize.acceptableInput && setGainDac.acceptableInput && setDacStepSize.acceptableInput){
            myInterface.setPwmKp(parseFloat(setGainPwm.text))
            myInterface.setDacKp(parseFloat(setGainDac.text))
            myInterface.setPwmStep(parseInt(setPwmStepSize.text))
            myInterface.setDacStep(parseInt(setDacStepSize.text))
        }
    }

    Settings{
        id: settings
        property string logFilePath
    }

    // Path
    FileDialog{
        id: logFileDialog
        title: "Open file"
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: {
            myInterface.setLogFilePath(logFileDialog.file)
            settings.logFilePath = myInterface.logFilePath
        }
    }

    Label{
        id: pathLabel
        text: "Log File Path"
        font.pixelSize: 20
        Layout.alignment: Qt.AlignBottom
    }

    TextField{
        id: path
        placeholderText: "Path"
        text: settings.logFilePath
        font.pixelSize: 18
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        Button{
            id: getPathButton
            width: path.width *0.1
            height: path.height
            anchors.right: path.right
            anchors.margins: 5
            text: "..."
            onClicked: logFileDialog.open()
        }
    }

    // Pwm
    Label{
        id: pwm
        text: "Pulse-width modulator"
        font.pixelSize: 20
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignBottom
    }
    TextField{
        id: setGainPwm
        placeholderText: "Gain"
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        //text: myInterface.pwmDefault // ASK PHILIPP IF HE WANTS TO SHOW THIS VALUE
        color: acceptableInput ? pathLabel.color:"red"
        validator: IntValidator {bottom: myInterface.pwmMin; top: myInterface.pwmMax}
        Label{
            id: warningPwmLabel
            anchors.top: setGainPwm.bottom
            width: setGainPwm.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.pwmMin + " and " + myInterface.pwmMax + " are valid."
            font.pixelSize: 12
        }
    }
    TextField{
        id: setPwmStepSize
        placeholderText: "Step"
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? pathLabel.color:"red"
        validator: IntValidator {bottom: myInterface.pwmMinStep; top: myInterface.pwmMaxStep}
        Label{
            id: warningPwmStepLabel
            anchors.top: setPwmStepSize.bottom
            width: setPwmStepSize.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.pwmMinStep + " and " + myInterface.pwmMaxStep + " are valid."
            font.pixelSize: 12
        }
    }


    // Dac
    Label{
        id: dac
        font.pixelSize: 20
        text: "Digital-to-Analog Converter"
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignBottom
    }
    TextField{
        id: setGainDac
        placeholderText: "Gain"
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? pathLabel.color:"red"
        validator: IntValidator {bottom: myInterface.dacMin ; top: myInterface.dacMax}
        Label{
            id: warningDacLabel
            anchors.top: setGainDac.bottom
            width: setGainDac.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.dacMin + " and " + myInterface.dacMax + " are valid."
            font.pixelSize: 12
        }
    }
    TextField{
        id: setDacStepSize
        placeholderText: "Step"
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? pathLabel.color:"red"
        validator: IntValidator {bottom: myInterface.dacMinStep; top: myInterface.dacMaxStep}
        Label{
            id: warningDacStepLabel
            anchors.top: setDacStepSize.bottom
            width: setDacStepSize.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.dacMinStep + " and " + myInterface.dacMaxStep + " are valid."
            font.pixelSize: 12
        }
    }

    // Submit button
    Button{
        id: submitButton
        text: "Submit"
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.maximumWidth: 150
        Layout.columnSpan: 2
        Layout.alignment: Qt.AlignHCenter
        onClicked: {
            validateValues()
        }
    }
}
