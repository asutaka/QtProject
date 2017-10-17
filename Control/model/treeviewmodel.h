#ifndef TREEVIEWMODEL_H
#define TREEVIEWMODEL_H

#include <QStandardItemModel>

class TreeViewModel : public QStandardItemModel
{
    Q_OBJECT
public:
    Q_INVOKABLE QString getText(const QModelIndex &itemIndex);
    Q_INVOKABLE QString getParent(const QModelIndex &itemIndex);
    Q_INVOKABLE int getIndex(const QModelIndex &itemIndex);
    Q_INVOKABLE QString getFullPath(const QModelIndex &itemIndex,const QString& character);
    Q_INVOKABLE void addEntry( QList<QString> listDependEntry, const QString& description );
    Q_INVOKABLE void addEntry( const QString& name, const QString& type, const QString& description );

    explicit TreeViewModel(QObject *parent = 0);
    virtual ~TreeViewModel() = default;

    enum TreeViewModel_Roles
    {
        TreeViewModel_Role_Name = Qt::DisplayRole,
        TreeViewModel_Role_Description = Qt::WhatsThisRole
    };

    QHash<int, QByteArray> roleNames() const override;

private:
    QStandardItem* getBranch( const QString& branchName );
    QHash<int, QByteArray> m_roleNameMapping;

};

#endif // TREEVIEWMODEL_H
