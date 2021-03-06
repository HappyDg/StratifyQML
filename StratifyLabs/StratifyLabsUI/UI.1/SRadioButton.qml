/*
Copyright 2016 Tyler Gilbert

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import QtQuick 2.6
import StratifyLabs.UI 1.0

SBaseRectangleText {
    id: check;
    property bool checked;

    type: "radiobutton";

    property var control: null;

    property string checkMark: Fa.Icon.circle;
    property string uncheckMark: Fa.Icon.circle_o;

    iconObject.width: fontSize;
    icon: checked ? checkMark : (uncheckMark);
    text: "Checkbox";
    hideTextOnSm: false;

    signal clicked();

    function updateControl(){
        if( control !== null ){
            if( checked ){
                control.active = check;
            }
        }
    }

    onCheckedChanged: {
        updateControl();
    }

    MouseArea {
        anchors.fill: parent;
        hoverEnabled: true;
        onClicked: {
            if(checked) return; //unchange status when this btn is alrady checked
            checked = !checked;
            check.clicked();
        }
        onEntered: startHover();
        onExited: stopHover();
    }

}
