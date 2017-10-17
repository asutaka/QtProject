
function showCalculator(obj,min,max) {
    lblCal.text="0";
    minVal=min;
    maxVal=max;
    virtualKey.visible=!virtualKey.visible;
    virtualKey.targetto=obj;
}
function display(obj)
{
    var strCal=lblCal.text;
    if(strCal.length>8)
    {
        lblCal.font.pixelSize=25;
        lblCal.anchors.topMargin=25;
    }
    if(strCal.length>16 && obj!==Qt.Key_Backspace.toString()
            && obj!==Qt.Key_Escape.toString() && obj!==Qt.Key_Equal.toString()) return;

    switch(obj)
    {
        case Qt.Key_0.toString():
            if(strCal==="0" || strCal==="-0")
            {
                return;
            }
            else
            {
                strCal+="0";
            }
            break;
        case Qt.Key_1.toString():
            if(strCal==="0")
            {
                strCal="1";
            }
            else if(strCal==="-0")
            {
                strCal="-1";
            }

            else
            {
                strCal+="1";
            }
            break;
        case Qt.Key_2.toString():
            if(strCal==="0")
            {
                strCal="2";
            }
            else if(strCal==="-0")
            {
                strCal="-2";
            }
            else
            {
                strCal+="2";
            }
            break;
        case Qt.Key_3.toString():
            if(strCal==="0")
            {
                strCal="3";
            }
            else if(strCal==="-0")
            {
                strCal="-3";
            }
            else
            {
                strCal+="3";
            }
            break;
        case Qt.Key_4.toString():
            if(strCal==="0")
            {
                strCal="4";
            }
            else if(strCal==="-0")
            {
                strCal="-4";
            }
            else
            {
                strCal+="4";
            }
            break;
        case Qt.Key_5.toString():
            if(strCal==="0")
            {
                strCal="5";
            }
            else if(strCal==="-0")
            {
                strCal="-5";
            }
            else
            {
                strCal+="5";
            }
            break;
        case Qt.Key_6.toString():
            if(strCal==="0")
            {
                strCal="6";
            }
            else if(strCal==="-0")
            {
                strCal="-6";
            }
            else
            {
                strCal+="6";
            }
            break;
        case Qt.Key_7.toString():
            if(strCal==="0")
            {
                strCal="7";
            }
            else if(strCal==="-0")
            {
                strCal="-7";
            }
            else
            {
                strCal+="7";
            }
            break;
        case Qt.Key_8.toString():
            if(strCal==="0")
            {
                strCal="8";
            }
            else if(strCal==="-0")
            {
                strCal="-8";
            }
            else
            {
                strCal+="8";
            }
            break;
        case Qt.Key_9.toString():
            if(strCal==="0")
            {
                strCal="9";
            }
            else if(strCal==="-0")
            {
                strCal="-9";
            }
            else
            {
                strCal+="9";
            }
            break;
        case Qt.Key_Comma.toString():
            if(strCal==="0")
            {
                strCal="0.";
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7" ||
                    strCal.slice(-1)==="(" || strCal.slice(-1)==="." ||
                    strCal.slice(-1)==="-" || strCal.slice(-1)===")")
            {
                return;
            }
            else
            {
                var strTemp = strCal;
                strTemp=replaceAll("+",";",strTemp);
                strTemp=replaceAll("\u2013",";",strTemp);
                strTemp=replaceAll("x",";",strTemp);
                strTemp=replaceAll("\u00f7",";",strTemp);
                var strArr=strTemp.split(";");
                if(strArr[strArr.length-1].indexOf(".")!==-1) return;

                strCal+=".";
            }
            break;
        case Qt.Key_Equal.toString():
            strCal=result(strCal);
            break;
        case Qt.Key_Plus.toString():
            if(strCal==="0")
            {
                return;
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7" ||
                    strCal.slice(-1)==="(" || strCal.slice(-1)==="." || strCal.slice(-1)==="-")
            {
                return;
            }
            else
            {
                strCal+="+";
            }
            break;
        case Qt.Key_Subtitle.toString():
            if(strCal==="0")
            {
                return;
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7" ||
                    strCal.slice(-1)==="(" || strCal.slice(-1)==="." || strCal.slice(-1)==="-")
            {
                return;
            }
            else
            {
                strCal+="\u2013";
            }
            break;
        case Qt.Key_multiply.toString():
            if(strCal==="0")
            {
                return;
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7" ||
                    strCal.slice(-1)==="(" || strCal.slice(-1)==="." || strCal.slice(-1)==="-")
            {
                return;
            }
            else
            {
                strCal+="x";
            }
            break;
        case Qt.Key_division.toString():
            if(strCal==="0")
            {
                return;
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7" ||
                    strCal.slice(-1)==="(" || strCal.slice(-1)==="." || strCal.slice(-1)==="-")
            {
                return;
            }
            else
            {
                strCal+="\u00f7";
            }
            break;
        case Qt.Key_Minus.toString():
            if(strCal==="0")
            {
                strCal="-0";
            }
            else if(strCal==="-0")
            {
                strCal="0";
            }
            else if(strCal.slice(-1)==="-")
            {
                strCal=strCal.substring(0,strCal.length-1);
            }
            else if(strCal.slice(-1)===")" || strCal.slice(-1)===".")
            {
                return;
            }
            else
            {
                strCal+="-";
            }
            break;
        case Qt.Key_ParenLeft.toString():
            if(strCal==="0")
            {
                strCal="(";
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7"|| strCal.slice(-1)==="(")
            {
                strCal+="(";
            }
            break;
        case Qt.Key_ParenRight.toString():
            if(strCal==="0")
            {
                return;
            }
            else if(strCal.slice(-1)==="+" || strCal.slice(-1)==="\u2013" ||
                    strCal.slice(-1)==="\u00d7" || strCal.slice(-1)==="\u00f7"
                    || strCal.slice(-1)==="(" || strCal.slice(-1)==="." || strCal.slice(-1)==="-")
            {
                return;
            }
            else if(countWord(strCal,0)>countWord(strCal,1))
            {
                strCal+=")";
            }
            break;
        case Qt.Key_Backspace.toString():
            if(strCal==="-0")
            {
                strCal="0";
            }
            if(strCal.length>1)
            {
                strCal=strCal.substring(0,strCal.length-1);
            }
            else
            {
                strCal="0";
            }
            break;
        case Qt.Key_Escape.toString():
            strCal="0"
            lblCal.font.pixelSize = 45;
            lblCal.anchors.topMargin = 5
            break;
    }

    lblCal.text=strCal;
}
function replaceAll(find, replace, str)
{
  while( str.indexOf(find) > -1)
  {
    str = str.replace(find, replace);
  }
  return str;
}
function countWord(v,isLeft){
    var matches = isLeft===0?v.match(/\(/g):v.match(/\)/g) ;
    return matches?matches.length:0;
}
function result(obj)
{
    var strTemp = obj,strResult;
    strTemp=replaceAll("\u2013","-",strTemp);
    strTemp=replaceAll("x","*",strTemp);
    strTemp=replaceAll("\u00f7","/",strTemp);
    strResult=eval(strTemp).toString();
    if(strResult.length>16)
    {
        strResult = strResult.substring(0,17);
    }
    if(strResult.length>8)
    {
        lblCal.font.pixelSize=25;
        lblCal.anchors.topMargin=25;
    }
    return strResult;
}
function autohideBar()
{
    if(yfitCenter == 0)
    {
        yfitCenter = 1
//        loaderStatusBar.source = "/StatusBar/testStatusBar.qml"
//        loaderBottomBar.source = "/BottomBar/testBottomBar.qml";

        mainModel.InnerChangeStatusBar(ScreenMng.testStatusBar);
        mainModel.InnerChangeBottomBar(ScreenMng.testBottomBar)
    }
    else
    {
        yfitCenter = 0
//        loaderStatusBar.source = "/StatusBar/StatusBar.qml"
//        loaderBottomBar.source = "/BottomBar/BottomBarMainPage.qml";
        mainModel.InnerChangeStatusBar(ScreenMng.StatusBar);
        mainModel.InnerChangeBottomBar(ScreenMng.BottomBarMainPage)

    }
}
function loadSwipe()
{
    return idComponent;
}
function hideDisplayMenu()
{
    idSwipe.isShowEnable = false;
}
function showDisplayMenu()
{
    idSwipe.isShowEnable = true;
}
