#include "treeviewmodel.h"

TreeViewModel::TreeViewModel(QObject *parent) : QStandardItemModel(parent) {

    m_roleNameMapping[TreeViewModel_Role_Name] = "name_role";
    m_roleNameMapping[TreeViewModel_Role_Description] = "description_role";

//    addEntry( "Option A", "Recommended", "This is Option A" );
}

void TreeViewModel::addEntry( const QString& name, const QString& type, const QString& description )
{
    auto childEntry = new QStandardItem(name);
    childEntry->setData( description, TreeViewModel_Role_Description );

    QStandardItem* entry = getBranch(type);
    entry->appendRow(childEntry);
}


void TreeViewModel::addEntry( QList<QString> listDependEntry, const QString& description ){
    QStandardItem* entry = getBranch(listDependEntry[0]);

    for (int level = 1; level < listDependEntry.count(); level++) {
        bool checkExistItem = false;
        QStandardItem *childEntry;
        for (int i = 0; i < entry->rowCount(); i++) {
            childEntry = entry->child(i,0);
            if (listDependEntry[i].compare(childEntry->text()) == 0) {
                checkExistItem = true;
                break;
            }
        }
        if (!checkExistItem) {
            childEntry = new QStandardItem(listDependEntry[level]);
            entry->appendRow(childEntry);
        }
        entry = childEntry;
    }
}

QStandardItem *TreeViewModel::getBranch(const QString &branchName) {
    QStandardItem* entry;
    auto entries = this->findItems( branchName );

    if ( entries.count() > 0 ){
        entry = entries.at(0);
    } else {
        entry = new QStandardItem( branchName );
        this->appendRow( entry );
    }
    return entry;
}

QString TreeViewModel::getText(const QModelIndex &itemIndex){
    QVariant val = itemIndex.data(Qt::DisplayRole);
    if(val.isValid())
        return  val.toString();
    else
        return QString();
}

QString TreeViewModel::getParent(const QModelIndex &itemIndex){
    QVariant val = itemIndex.parent().data(Qt::DisplayRole);
    if(val.isValid())
        return  val.toString();
    else
        return "root";
}

int TreeViewModel::getIndex(const QModelIndex &itemIndex){
    return  itemIndex.row();
}
QString TreeViewModel::getFullPath(const QModelIndex &itemIndex,const QString& character){
    QModelIndex val = itemIndex;
    QVariant varitant = val.data(Qt::DisplayRole);
    QString strResult = varitant.toString();
    while(true){
        varitant = val.parent().data(Qt::DisplayRole);
        if(!varitant.isValid()){
            break;
        }
        strResult.insert(0,character);
        strResult.insert(0,varitant.toString());
        val = val.parent();
    }
    return strResult;
}

QHash<int, QByteArray> TreeViewModel::roleNames() const{
    return m_roleNameMapping;
}
