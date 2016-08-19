#!/usr/bin/env bash
#install es 2.3.1版本
read -p "Enter your install path :" ES_DIR
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.1/elasticsearch-2.3.1.tar.gz
sudo mkdir $ES_DIR
tar -zxvf elasticsearch-2.3.1.tar.gz -C $ES_DIR/

wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v1.9.1/elasticsearch-analysis-ik-1.9.1.zip
sudo mkdir -p $ES_DIR/elasticsearch-2.3.1/plugins
unzip elasticsearch-analysis-ik-*.zip  -d $ES_DIR/elasticsearch-2.3.1/plugins/ik
sudo rm ./elasticsearch*
ES_HOME=$ES_DIR/elasticsearch-2.3.1
cd $ES_HOME
echo "index.analysis.analyzer.default.type: ik" >> $ES_HOME/config/elasticsearch.yml
##添加es 用户组 es 启动不能使用root用户
sudo groupadd elsearch
sudo useradd elsearch -g elsearch
sudo chown -R elsearch:elsearch  $ES_DIR
#创建软连接
sudo ln -s $ES_HOME/bin/elasticsearch.sh /usr/local/bin/elasticsearch
