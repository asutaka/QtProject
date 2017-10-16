#ifndef ENUMCONTROL_H
#define ENUMCONTROL_H
#include <QObject>

class EnumControl
{
    Q_GADGET

public:
    enum class BackgroundImageLayout {
        BACKGROUND_IMAGE_LAYOUT_NONE=0,
        BACKGROUND_IMAGE_LAYOUT_TILE=1,
        BACKGROUND_IMAGE_LAYOUT_CENTER=2,
        BACKGROUND_IMAGE_LAYOUT_STRETCH=3,
        BACKGROUND_IMAGE_LAYOUT_ZOOM=4,
    };
    Q_ENUM(BackgroundImageLayout)

    enum class BorderStyle {
        BORDER_STYLE_NONE=0,
        BORDER_STYLE_FIXED_SINGLED=1,
        BORDER_STYLE_FIXED_3D=2,
    };
    Q_ENUM(BorderStyle)

    enum class Modifiers {
        MODIFIERS_PRIVATE=0,
        MODIFIERS_INTERNAL=1,
        MODIFIERS_PROTECTED_INTERNAL=2,
        MODIFIERS_PROTECTED=3,
        MODIFIERS_PUBLIC=4,
    };
    Q_ENUM(Modifiers)

    enum class Anchor {
        ANCHOR_NONE=0,
        ANCHOR_TOP=1,
        ANCHOR_LEFT=2,
        ANCHOR_RIGHT=3,
        ANCHOR_BOTTOM=4,
        ANCHOR_TOP_LEFT=5,
        ANCHOR_TOP_RIGHT=6,
        ANCHOR_TOP_BOTTOM=7,
        ANCHOR_LEFT_RIGHT=8,
        ANCHOR_LEFT_BOTTOM=9,
        ANCHOR_RIGHT_BOTTOM=10,
        ANCHOR_TOP_LEFT_RIGHT=11,
        ANCHOR_TOP_LEFT_BOTTOM=12,
        ANCHOR_LEFT_RIGHT_BOTTOM=13,
        ANCHOR_TOP_LEFT_RIGHT_BOTTOM=14,
    };
    Q_ENUM(Anchor)

    enum class AutoSizeMode {
        AUTOSIZE_MODE_GROW_ONLY=false,
        AUTOSIZE_MODE_GROW_AND_SHRINK=true,
    };
    Q_ENUM(AutoSizeMode)

    enum class Dock {
        DOCK_NONE=0,
        DOCK_TOP=1,
        DOCK_LEFT=2,
        DOCK_FILL=3,
        DOCK_RIGHT=4,
        DOCK_BOTTOM=5,
    };
    Q_ENUM(Dock)

    enum class FlowDirection {
        FLOW_DIRECTION_LEFT_TO_RIGHT=0,
        FLOW_DIRECTION_TOP_DOWN=1,
        FLOW_DIRECTION_RIGHT_TO_LEFT=2,
        FLOW_DIRECTION_BOTTOM_UP=3,
    };
    Q_ENUM(FlowDirection)

    enum class LangCode {
        JPN = 0,
        ENG,
        CHN,
        KRE,
        GER,
        FRA,
        DUT,
        SPN,
        POR,
        POL,
        HGR,
        GRE,
        DAN,
        FIN,
        THA,
        RUS,
    };
    Q_ENUM(LangCode)

    enum class EventId {
        START = 0,
        STOP,
    };
    Q_ENUM(EventId)

    enum class StatusMachine{
        STATUS_START = 0,
        STATUS_STOP,
    };
    Q_ENUM(StatusMachine)
};
#endif // ENUMCONTROL_H
