import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

GridLayout{
    width: parent.width *0.4
    height: parent.height *0.6
    columns: 2
    columnSpacing: 20

    function validateValues() {
        // pwm
        warningPwmLabel.visible = !setPwm.acceptableInput;
        warningPwmStepLabel.visible = !setPwmStepSize.acceptableInput;

        // dac
        warningDacLabel.visible = !setDac.acceptableInput;
        warningDacStepLabel.visible = !setDacStepSize.acceptableInput;

        // if all are valid change the values
        if (setPwm.acceptableInput && setPwmStepSize.acceptableInput && setDac.acceptableInput && setDacStepSize.acceptableInput){
            myInterface.setPwmKp(parseFloat(setPwm.text))
            myInterface.setDacKp(parseFloat(setDac.text))
            myInterface.setPwmStep(parseInt(setPwmStepSize.text))
            myInterface.setDacStep(parseInt(setDacStepSize.text))

            console.log("The new pwm gain and step values are", myInterface.pwmKp, myInterface.pwmStep)
            console.log("The new dac gain and step values are", myInterface.dacKp, myInterface.dacStep)
        }
    }

    // Path
    Label{
        id: pathLabel
        text: "Path"
        font.pixelSize: 20
        Layout.alignment: Qt.AlignBottom
    }

    TextField{
        id: path
        placeholderText: "File Path"
        font.pixelSize: 18
        Layout.columnSpan: 2
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
    }

    // Gain
    Label{
        id: gain1
        text: "Gain 1"
        font.pixelSize: 20
        Layout.alignment: Qt.AlignBottom
    }
    Label{
        id: gain2
        text: "Gain 2"
        font.pixelSize: 20
        Layout.alignment: Qt.AlignBottom
    }
    TextField{
        id: setPwm
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        //text: myInterface.pwmDefault // ASK PHILIPP IF HE WANTS TO SHOW THIS VALUE
        color: acceptableInput ? "white":"red" // ASK PHILIPP IF HE WANTS THIS FEATURE
        validator: IntValidator {bottom: myInterface.pwmMin; top: myInterface.pwmMax}
        Label{
            id: warningPwmLabel
            anchors.top: setPwm.bottom
            width: setPwm.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.pwmMin + " and " + myInterface.pwmMax + " are valid."
            font.pixelSize: 12
        }
    }
    TextField{
        id: setDac
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? "white":"red"
        validator: IntValidator {bottom: myInterface.dacMin ; top: myInterface.dacMax}
        Label{
            id: warningDacLabel
            anchors.top: setDac.bottom
            width: setDac.width
            visible: false
            color: "red"
            text: "Only values between " + myInterface.dacMin + " and " + myInterface.dacMax + " are valid."
            font.pixelSize: 12
        }
    }

    // Step size
    Label{
        id: stepSize1
        font.pixelSize: 20
        text: "Step size 1"
        Layout.alignment: Qt.AlignBottom
    }
    Label{
        id: stepSize2
        font.pixelSize: 20
        text: "Step size 2"
        Layout.alignment: Qt.AlignBottom
    }
    TextField{
        id: setPwmStepSize
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? "white":"red"
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
    TextField{
        id: setDacStepSize
        font.pixelSize: 18
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop
        color: acceptableInput ? "white":"red"
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
