import QtQuick 2.0
import CommonControl 1.0

Item {
    id: itemQwertyLayout
    property int widthKeyBoard: 1024
    property int posStartKey: 80
    property string backgroundColor: "#1C1C1C"
    property bool isCapital : true
    property bool isNumber: false
    property var keyObj: Qt.createComponent("KeyboardComponent.qml");
    property bool isShowNumber2: false
    property bool isShowBtnCapsLock: true
    property bool isEnglish: true
    property bool isFistJp: true
    property bool isKana: false
    property var key: null
    property int spaceColKey: (widthKeyBoard - 600 - posStartKey*2)/9+ 60;
    signal keyClick(string text)
    width: 1024
    height: 300
    Rectangle{
        id: rectQwertyLayout
        x: 0
        y:0
        width: widthKeyBoard
        height: 300
        color:backgroundColor
        KeyButtonControl{
            id: btnCapsLock
            x: 80
            y: 150
            colorKey: "#696969"
            widthKey: 105
            sourceKey: "qrc:/Images/keyboard_shift.png"
            viewImage: true
            visible: (!isNumber&&isEnglish)
            txtKey: isEnglish?"Caps Lock":"次"
            onClicked: {
                isCapital=!isCapital
                defineControl();
            }
        }
        KeyButtonControl{
            id: btnSwitchLayoutJp
            x: 80
            y: 150
            colorKey: "#696969"
            widthKey: 105
            visible: (!isEnglish&&!isNumber)
            txtKey: "あ/ア"
            onClicked: {
                isKana = !isKana
                isFistJp =true
                btnNextPanel.sourceKey= "qrc:/Images/keyboard_nextPanel.png";
                btnNextPanel.txtKey="次"
                defineControl();
            }
        }
        KeyButtonControl{
            id: btnShowNumber2
            x: 80
            y: 150
            colorKey: "#696969"
            widthKey: 105
            visible: isNumber
            txtKey: isShowNumber2?"!@#":"123"
            onClicked: {
                isShowNumber2 = !isShowNumber2
                defineControl();
            }
        }
        KeyButtonControl{
            x: 260
            y: 220
            widthKey: 420
            txtKey: "Space"
            textToolTip:isEnglish?"Space":"スペース"
            viewImage: true
            onClicked: {
                itemQwertyLayout.keyClick(txtKey);
            }
        }
        KeyButtonControl{
            id: switchNumOrText
            x: 80
            y: 220
            fontSizeText: 24
            colorKey: "#696969"
            txtKey: (!isNumber)?"abc":"123"
            onClicked: {
                isNumber = !isNumber
                if(isNumber&&(!isEnglish)){
                   btnNextPanel.visible = false;
                }
                isShowBtnCapsLock= !isShowBtnCapsLock
                defineControl();
            }
        }
        KeyButtonControl{
            x: 170
            y: 220
            colorKey: "#696969"
            sourceKey: "qrc:/Images/changeLanguage.png"
            viewImage: true
            txtKey: isEnglish?"Change Language":"言語を変更"
            onClicked: {
                isEnglish= !isEnglish;
                if(!isEnglish){
                    isKana= false;
                    isFistJp = true
                }
                if(isNumber == true){
                    isCapital = !isCapital
                    isNumber = !isNumber
                    isShowNumber2=!isShowNumber2
                }
                defineControl();
            }
        }
        KeyButtonControl{
            x: 705
            y: 220
            colorKey: "#696969"
            sourceKey: "qrc:/Images/preMouse.png"
            viewImage: true
            txtKey: "Previous Mouse"
            textToolTip: isEnglish?"Previous Mouse":"前のマウス"
            onClicked: {
                itemQwertyLayout.keyClick(txtKey);
            }
        }
        KeyButtonControl{
            x: 795
            y: 220
            colorKey: "#696969"
            sourceKey: "qrc:/Images/nextMouse.png"
            viewImage: true
            txtKey:"Next Mouse"
            textToolTip:isEnglish?"Next Mouse":"次にマウス"
            onClicked: {
                itemQwertyLayout.keyClick(txtKey);
            }
        }
        KeyButtonControl{
            x: 885
            y: 220
            colorKey: "#696969"
            sourceKey: "qrc:/Images/keyboard_enter2.png"
            viewImage: true
            txtKey:"Enter"
            textToolTip:isEnglish?"Enter":"入る"
            onClicked: {
                itemQwertyLayout.keyClick(txtKey);
            }
        }
        KeyButtonControl {
            x: 840
            y:150
            colorKey: "#696969"
            widthKey: 105
            viewImage: true
            sourceKey: "qrc:/Images/keyboard_del.png"
            txtKey: "Delete"
            textToolTip: isEnglish?"Delete":"削除"
            onClicked: {
                itemQwertyLayout.keyClick(txtKey);
            }
            onPressAndHold: {
                inputKeyboard.objText.text = "";
            }
        }
        KeyButtonControl{
            id:btnNextPanel
            x: 750
            y: 150
            colorKey: "#696969"
            sourceKey: "qrc:/Images/keyboard_nextPanel.png"
            viewImage: true
            visible: ((!isNumber)&&(!isEnglish))
            txtKey:"次"
            onClicked: {
                isFistJp = !isFistJp;
                if(isFistJp){
                    btnNextPanel.sourceKey= "qrc:/Images/keyboard_nextPanel.png";
                    btnNextPanel.txtKey="次"
                }
                else{
                    btnNextPanel.sourceKey= "qrc:/Images/keyboard_backPanel.png";
                    btnNextPanel.txtKey = "バック"
                }
                defineControl();
            }
        }
        Rectangle{
            id: rectSymbol
            color: "transparent"
            width: parent.width
            height: 220
        }
        Component.onCompleted: {
            defineControl();
        }
    }
    function getTxtKey(sKey)
    {
        itemQwertyLayout.keyClick(sKey);
    }
    function defineControl(){
        var symbolEnglish =["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P","A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"];
        var symbolEnglishNoCap =[ "q", "w", "e", "r", "t", "y", "u", "i", "o", "p","a", "s", "d", "f", "g", "h", "j", "k", "l","z", "x", "c", "v", "b", "n", "m" ];
        var symbolNumberEg1 =["1", "2", "3", "4", "5", "6", "7", "8", "9", "0","-", "=", "\\", "[", "]", ";", "'", ",", ".","/", "<", ">", "?", ":", "\"", "`"];
        var symbolNumberEg2 =["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "|", "{", "}", "~", "mg", "lb", "cc","g", "oz", "ml", "kg", ":", "\"", "`"];
        var symbolHira1 =["わ", "ら", "や", "ま", "は", "を", "り", "ゆ", "み","ひ", "ん", "る", "よ", "む", "ふ", "一", "れ", "\"。", "め","へ","&", "ろ", "も", "ほ","な"]
        var symbolHira2 =["な", "た", "さ", "か", "あ", "に", "ち", "し", "き","い", "ぬ", "つ", "す", "く", "う", "ね", "て", "せ", "け","え", "の", "と", "そ", "こ","お"]
        var symbolKana1 =["ワ","ラ","ヤ",　"マ",　"ハ","オ","リ","ユ",　"ミ",　"ヒ", "ン",　"ル",　"ヨ","ム","フ","ー","レ","メ","ヘ", "＆","ロ","\"。","モ",　"ホ","ナ"]
        var symbolKana2 =["ナ", "タ", "サ", "カ", "ア ","ニ", "チ", "シ", "キ", "イ", "ヌ", "ツ", "ス", "ク","ウ","ネ", "テ", "セ","ケ","エ","ノ",　"ト",　"ソ","コ",　"オ"]
        rectSymbol.children = "";
        for(var i =0;i< symbolEnglish.length;i++ ){
            if(isEnglish){
                if(!isNumber){
                    if(isCapital){
                        showKey(i, symbolEnglish[i]);
                    }
                    else {
                        showKey(i, symbolEnglishNoCap[i]);
                    }
                }
                else{
                    if(!isShowNumber2){
                        showKey(i, symbolNumberEg1[i]);
                    }
                    else{
                        showKey(i, symbolNumberEg2[i]);
                    }
                }
            }
            else //isJapan
            {
                if(isNumber){
                    if(!isShowNumber2){
                        showKey(i, symbolNumberEg1[i]);
                    }
                    else {
                        showKey(i, symbolNumberEg2[i]);
                    }
                }
                else{
                    if(isFistJp){
                        if(!isKana){
                            showKey(i, symbolHira1[i]);
                        }
                        else{
                            showKey(i, symbolKana1[i]);
                        }
                    }
                    else{
                        if(!isKana){
                            showKey(i, symbolHira2[i]);
                        }
                        else{
                            showKey(i, symbolKana2[i]);
                        }
                    }
                }
            }
        }
    }
    function showKey(index,value){
        if(index<10){
            key=keyObj.createObject(rectSymbol, {"x": posStartKey+index*spaceColKey, "y": 10, "txtKey": value});
        }
        else {if(index<19){
                key= keyObj.createObject(rectSymbol, {"x": posStartKey+45+(index-10)*spaceColKey, "y": 80, "txtKey":value});
            }
            else if(index<26) {
                if ((!isEnglish)&&(index === 25)&&(!isNumber)){
                    btnNextPanel.visible= true;
                }
                else{
                    key=keyObj.createObject(rectSymbol, {"x": posStartKey+135+(index-19)*spaceColKey, "y": 150, "txtKey": value});
                }
            }
        }
        key.clicked.connect(getTxtKey);
    }
}
