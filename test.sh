#!/bin/sh

DEVR="10.208.21.249"
SERVERKEY=/home/sysadmin/.ssh/id_rsa
SYNC_DIR=/var/www/html/lapis/resource/mst/
TARGET_STR=P3raZX89
VERSION=7

CHECK_CMD="ssh -l sysadmin -o 'StrictHostKeyChecking=no' -i ${SERVERKEY} ${DEVR} "
CNT_CMD="${CHECK_CMD}find ${SYNC_DIR} -name '*${TARGET_STR}.dat' | wc -l"
CNT=`eval ${CNT_CMD}`
echo ${CNT}
if [ ${CNT} -gt 1 ] ; then
	# 古いバージョンや該当ファイル以外が存在した場合単一性を図るため更新対象以外は削除する
	RM_CMD="${CHECK_CMD}find ${SYNC_DIR} -name '*${TARGET_STR}.dat' -and -not -name '*${VERSION}_${TARGET_STR}.dat' -type f | xargs ${CHECK_CMD}rm -v"
	eval ${RM_CMD}
elif [ ${CNT} -eq 0 ] ; then
     	echo "Ver${VERSION}_${TARGET_STR}.dat file get failed."
        exit 1
fi

exit 0
