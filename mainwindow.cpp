#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::on_pushButton_clicked()
{
  QSslConfiguration sslConfiguration(QSslConfiguration::defaultConfiguration());
  //sslConfiguration.setProtocol(QSsl::TlsV1_2);

  QNetworkAccessManager *manager = new QNetworkAccessManager(this);
  connect(manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(replyFinished(QNetworkReply*)));
  manager->get(QNetworkRequest(QUrl("https://artwo.sytes.net")));
}

void MainWindow::replyFinished(QNetworkReply * reply)
{
   QByteArray asdf = reply->readAll();

  qDebug() << (QString("asdf %1").arg(asdf.length()));
  qDebug() << (QString(asdf));

  ui->plainTextEdit->setPlainText(QString(asdf));
}
