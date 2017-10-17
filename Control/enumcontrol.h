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

    enum class CellBorderStyle {
        CELL_BORDER_STYLE_CUSTOM = 0,
        CELL_BORDER_STYLE_SINGLE = 1,
        CELL_BORDER_STYLE_RAISED = 2,
        CELL_BORDER_STYLE_SUNKEN = 3,
        CELL_BORDER_STYLE_NONE = 4,
        CELL_BORDER_STYLE_SINGLE_VERTICAL = 5,
        CELL_BORDER_STYLE_RAISED_VERTICAL = 6,
        CELL_BORDER_STYLE_SUNKEN_VERTICAL = 7,
        CELL_BORDER_STYLE_SINGLE_HORIZONTAL = 8,
        CELL_BORDER_STYLE_RAISED_HORIZONTAL = 9,
        CELL_BORDER_STYLE_SUNKEN_HORIZONTAL = 10,
    };
    Q_ENUM(CellBorderStyle)

    enum class EnableWithAutoHeaderText {
        CLIP_BOARD_COPY_MODE_DISABLE = 0,
        CLIP_BOARD_COPY_MODE_ENABLE_WITH_AUTO_HEADER_TEXT = 1,
        CLIP_BOARD_COPY_MODE_ENABLE_WITHOUT_HEADER_TEXT = 2,
        CLIP_BOARD_COPY_MODE_ENABLE_ALWAYS_INCLUDE_HEADER_TEXT = 3,
    };
    Q_ENUM(EnableWithAutoHeaderText)

    enum class SelectionMode {
        SELECTION_MODE_CELL_SELECT = 0,
        SELECTION_MODE_FULL_ROW_SELECT = 1,
        SELECTION_MODE_ROW_HEADER_SELECT = 2,
        SELECTION_MODE_FULL_COLUMN_SELECT = 3,
        SELECTION_MODE_COLUMN_HEADER_SELECT = 4,
    };
    Q_ENUM(SelectionMode)

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

    enum class Activation {
        ACTIVATION_ONECLICK = 0,
        ACTIVATION_TWOCLICK = 1,
    };
    Q_ENUM(Activation)

    enum class Alignment{
        ALIGNMENT_TOP = 0,
        ALIGNMENT_LEFT = 1,
    };
    Q_ENUM(Alignment)

    enum class View{
        VIEW_LARGEICON = 0,
        VIEW_DETAIL = 1,
        VIEW_SMALLICON = 2,
        VIEW_LIST = 3,
        VIEW_TILE = 4,
    };
    Q_ENUM(View)

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
