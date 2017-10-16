#ifndef LANG_GLOBAL_H
#define LANG_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LANG_LIBRARY)
#  define LANGSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LANGSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // LANG_GLOBAL_H
