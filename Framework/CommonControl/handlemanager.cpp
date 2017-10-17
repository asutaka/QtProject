#include "handlemanager.h"

HandleManager::HandleManager() {

}

HandleManager::~HandleManager() {

}

void HandleManager::setBlockSignal(QObject* obj, bool isBlock) {
    if (!obj)
        return;

    obj->blockSignals(isBlock);
}

