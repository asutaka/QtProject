import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1

FocusScope {
    id: root

    implicitWidth: 240
    implicitHeight: 150

    /*!
        This property tells the ScrollView if it should render
        a frame around its content.

        The default value is \c false.
    */
    property bool frameVisible: false

    /*! \qmlproperty enumeration ScrollView::horizontalScrollBarPolicy
        \since QtQuick.Controls 1.3

        This property holds the policy for showing the horizontal scrollbar.
        It can be any of the following values:
        \list
        \li Qt.ScrollBarAsNeeded
        \li Qt.ScrollBarAlwaysOff
        \li Qt.ScrollBarAlwaysOn
        \endlist

        The default policy is \c Qt.ScrollBarAsNeeded.
     */
    property alias horizontalScrollBarPolicy: scroller.horizontalScrollBarPolicy

    /*! \qmlproperty enumeration ScrollView::verticalScrollBarPolicy
        \since QtQuick.Controls 1.3

        This property holds the policy for showing the vertical scrollbar.
        It can be any of the following values:
        \list
        \li Qt.ScrollBarAsNeeded
        \li Qt.ScrollBarAlwaysOff
        \li Qt.ScrollBarAlwaysOn
        \endlist

        The default policy is \c Qt.ScrollBarAsNeeded.
     */
    property alias verticalScrollBarPolicy: scroller.verticalScrollBarPolicy

    /*!
        This property controls if there should be a highlight
        around the frame when the ScrollView has input focus.

        The default value is \c false.

        \note This property is only applicable on some platforms, such
        as Mac OS.
    */
    property bool highlightOnFocus: false

    /*!
        \qmlproperty Item ScrollView::viewport

        The viewport determines the current "window" on the contentItem.
        In other words, it clips it and the size of the viewport tells you
        how much of the content area is visible.
    */
    property alias viewport: viewportItem

    /*!
        \qmlproperty Item ScrollView::flickableItem

        The flickableItem of the ScrollView. If the contentItem provided
        to the ScrollView is a Flickable, it will be the \l contentItem.
    */
    readonly property alias flickableItem: internal.flickableItem

    /*!
        The contentItem of the ScrollView. This is set by the user.

        Note that the definition of contentItem is somewhat different to that
        of a Flickable, where the contentItem is implicitly created.
    */
    default property Item contentItem

    /*! \internal */
    property alias __scroller: scroller
    /*! \internal */
    property alias __verticalScrollbarOffset: scroller.verticalScrollbarOffset
    /*! \internal */
    property alias __wheelAreaScrollSpeed: wheelArea.scrollSpeed
    /*! \internal */
    property int __scrollBarTopMargin: 0
    /*! \internal */
    property int __viewTopMargin: 0
    /*! \internal */
    property alias __horizontalScrollBar: scroller.horizontalScrollBar
    /*! \internal */
    property alias __verticalScrollBar: scroller.verticalScrollBar
    /*! \qmlproperty Component ScrollView::style

        The style Component for this control.
        \sa {Qt Quick Controls Styles QML Types}

    */
    property Component style: Settings.styleComponent(Settings.style, "ScrollViewStyle.qml", root)

    /*! \internal */
    property Style __style: styleLoader.item

    activeFocusOnTab: true

    onContentItemChanged: {

        if (contentItem.hasOwnProperty("contentY") && // Check if flickable
                contentItem.hasOwnProperty("contentHeight")) {
            internal.flickableItem = contentItem // "Use content if it is a flickable
            internal.flickableItem.parent = viewportItem
        } else {
            internal.flickableItem = flickableComponent.createObject(viewportItem)
            contentItem.parent = internal.flickableItem.contentItem
        }
        internal.flickableItem.anchors.fill = viewportItem
        if (!Settings.hasTouchScreen)
            internal.flickableItem.interactive = false
    }


    children: Item {
        id: internal

        property Flickable flickableItem

        Loader {
            id: styleLoader
            sourceComponent: style
            onStatusChanged: {
                if (status === Loader.Error)
                    console.error("Failed to load Style for", root)
            }
            property alias __control: root
        }

        Binding {
            target: flickableItem
            property: "contentHeight"
            when: contentItem !== flickableItem
            value: {
                if(contentItem){
                    return contentItem.height
                }
                else {
                    return 0
                }
            }
        }

        Binding {
            target: flickableItem
            when: contentItem !== flickableItem
            property: "contentWidth"
            value: {
                if(contentItem){
                    return contentItem.width
                }
                else {
                    return 0
                }
            }
        }

        Connections {
            target: flickableItem

            onContentYChanged:  {
                scroller.blockUpdates = true
                scroller.verticalScrollBar.value = flickableItem.contentY - flickableItem.originY
                scroller.blockUpdates = false
            }

            onContentXChanged:  {
                scroller.blockUpdates = true
                scroller.horizontalScrollBar.value = flickableItem.contentX - flickableItem.originX
                scroller.blockUpdates = false
            }

        }

        anchors.fill: parent

        Component {
            id: flickableComponent
            Flickable {}
        }

        WheelArea {
            id: wheelArea
            parent: flickableItem
            z: -1
            // ### Note this is needed due to broken mousewheel behavior in Flickable.

            anchors.fill: parent

            property int acceleration: 40
            property int flickThreshold: Settings.dragThreshold
            property real speedThreshold: 3
            property real ignored: 0.001 // ## flick() does not work with 0 yVelocity
            property int maxFlick: 400

            property bool horizontalRecursionGuard: false
            property bool verticalRecursionGuard: false
            property bool isVerticalMaximumValueChanged: false

            horizontalMinimumValue: 0
            horizontalMaximumValue: {
                wheelArea.horizontalRecursionGuard = true
                //if horizontalMaximumValue changed, horizontalValue may be actually synced with
                wheelArea.horizontalValue = flickableItem.contentX - flickableItem.originX;
                wheelArea.horizontalRecursionGuard = false
                if(flickableItem){
                    return flickableItem.contentWidth - viewport.width
                }
                else {
                    return 0
                }
            }

            verticalMinimumValue: 0
            verticalMaximumValue:{
                wheelArea.verticalRecursionGuard = true
                //if verticalMaximumValue changed, verticalValue may be actually synced with
                wheelArea.verticalValue = flickableItem.contentY - flickableItem.originY;
                wheelArea.verticalRecursionGuard = false
                if(flickableItem){
                    return flickableItem.contentHeight - viewport.height + __viewTopMargin
                }
                else {
                    return 0
                }
            }

            // The default scroll speed for typical angle-based mouse wheels. The value
            // comes originally from QTextEdit, which sets 20px steps by default, as well as
            // QQuickWheelArea.
            // TODO: centralize somewhere, QPlatformTheme?
            scrollSpeed: 20 * (__style && __style.__wheelScrollLines || 1)

            Connections {
                target: flickableItem

                onContentYChanged: {
                    wheelArea.verticalRecursionGuard = true
                    wheelArea.verticalValue = flickableItem.contentY - flickableItem.originY
                    wheelArea.verticalRecursionGuard = false
                }
                onContentXChanged: {
                    wheelArea.horizontalRecursionGuard = true
                    wheelArea.horizontalValue = flickableItem.contentX - flickableItem.originX
                    wheelArea.horizontalRecursionGuard = false
                }
            }

            onVerticalValueChanged: {
                if (!verticalRecursionGuard) {
                    var effectiveContentY = flickableItem.contentY - flickableItem.originY
                    if (effectiveContentY < flickThreshold && verticalDelta > speedThreshold) {
                        flickableItem.flick(ignored, Math.min(maxFlick, acceleration * verticalDelta))
                    } else if (effectiveContentY > flickableItem.contentHeight - flickThreshold - viewport.height
                               && verticalDelta < -speedThreshold) {
                        flickableItem.flick(ignored, Math.max(-maxFlick, acceleration * verticalDelta))
                    } else {
                        flickableItem.contentY = verticalValue + flickableItem.originY
                    }
                }
            }

            onHorizontalValueChanged: {
                if (!horizontalRecursionGuard)
                    flickableItem.contentX = horizontalValue + flickableItem.originX
            }
        }

        ScrollViewHelper {
            id: scroller
            anchors.fill: parent
            active: wheelArea.active
            property bool outerFrame: {
                var result = 0
                if(__style){
                    result =  __style.__externalScrollBars
                }
                return (!frameVisible || !result)
            }
            property int scrollBarSpacing: {
                if(outerFrame)
                {
                    return 0
                }
                else if(__style){
                    return __style.__scrollBarSpacing
                }
                else {
                    return 0
                }
            }
            property int verticalScrollbarOffset: {
                if(verticalScrollBar.visible && !verticalScrollBar.isTransient){
                    return verticalScrollBar.width + scrollBarSpacing
                }
                return 0
            }
            property int horizontalScrollbarOffset: {
                if(horizontalScrollBar.visible && !horizontalScrollBar.isTransient){
                    return horizontalScrollBar.height + scrollBarSpacing
                }
                return 0
            }
            Loader {
                id: frameLoader
                sourceComponent: {
                    if(__style){
                        return __style.frame
                    }
                    else {
                        return null
                    }
                }
                anchors.fill: parent
                anchors.rightMargin: {
                    if(scroller.outerFrame){
                        return 0
                    }
                    else {
                        return scroller.verticalScrollbarOffset
                    }
                }
                anchors.bottomMargin: {
                    if(scroller.outerFrame){
                        return 0
                    }
                    else {
                        return scroller.horizontalScrollbarOffset
                    }
                }
            }

            Item {
                id: viewportItem
                anchors.fill: frameLoader
                anchors.topMargin: {
                    if(frameVisible){
                        return __style.padding.top
                    }
                    else {
                        return 0
                    }
                }
                anchors.leftMargin: {
                    if(frameVisible){
                        return __style.padding.left
                    }
                    else {
                        return 0
                    }
                }
                anchors.rightMargin: {
                    var tmp = 0
                    if(frameVisible){
                        tmp += __style.padding.right
                    }
                    if(scroller.outerFrame){
                        tmp += scroller.verticalScrollbarOffset
                    }
                    return tmp
                }
                anchors.bottomMargin: {
                    var tmp = 0
                    if(frameVisible){
                        tmp += __style.padding.bottom
                    }
                    if(scroller.outerFrame){
                        tmp += scroller.horizontalScrollbarOffset
                    }
                    return tmp
                }
                clip: true
            }
        }
        FocusFrame { visible: highlightOnFocus && root.activeFocus }
    }
}
