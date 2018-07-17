#! /bin/bash
declare -a ports=("60030" "8095" "8440" "8500" "16020" "3888" "8099" "7788" "9997" "8744" "9995" "2888" "18080" "19888" "11000" "10001" "9089" "9090" "22" "60000" "6080" "8081" "8443" "9996" "8090" "8032" "8042" "50070" "10000" "7778" "9999" "9092" "8096" "8020" "8088" "60010" "21000" "8050" "80" "8886" "15000" "32051" "7777" "2181" "8080" "9083" "3080" "8441")


declare -a ports=("22" "80" "179" "443" "500" "2222" "2380" "3306" "4001" "4194" "4444" "4567" "4568" "5000" "5044" "5046" "8001" "8080" "8082" "8084" "8101" "8181" "8443" "8500" "8600" "8743" "8888" "9200" "9235" "9300" "9443" "18080" "24007" "24008" "35357")


for i in "${ports[@]}"
do
   openstack security group rule create icp_open_ports  --proto=tcp --dst-port="$i":"$i"
done
openstack security group rule create icp_open_ports  --proto=tcp --dst-port=49152:49251
openstack security group rule create icp_open_ports  --proto=tcp --dst-port=10248:10252
openstack security group rule create icp_open_ports  --proto=tcp --dst-port=30000:32767
openstack security group rule create icp_open_ports  --proto=udp --dst-port=500:500
openstack security group rule create icp_open_ports  --proto=udp --dst-port=4500:4500
