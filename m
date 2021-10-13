Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8ED42B43C
	for <lists+linux-nfc@lfdr.de>; Wed, 13 Oct 2021 06:31:26 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BF6A1100EA2B4;
	Tue, 12 Oct 2021 21:31:22 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=61.164.42.155; helo=zju.edu.cn; envelope-from=linma@zju.edu.cn; receiver=<UNKNOWN> 
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
	by ml01.01.org (Postfix) with ESMTP id A386D100EBB6F
	for <linux-nfc@lists.01.org>; Tue, 12 Oct 2021 21:31:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [222.205.7.222])
	by mail-app4 (Coremail) with SMTP id cS_KCgCXDSkQYWZhWpicAw--.35224S4;
	Wed, 13 Oct 2021 12:31:12 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: linux-nfc@lists.01.org
Date: Wed, 13 Oct 2021 12:30:52 +0800
Message-Id: <20211013043052.16379-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CM-TRANSID: cS_KCgCXDSkQYWZhWpicAw--.35224S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4xJrWDWryxKrWxtrWDurg_yoW8Xw1kpa
	yfWFy3ta1DWr1ayF4UZFy8Xr13Zw4kGFZ7Kr95uw45C39xJryIvr4ktrya9FWDCFZ5Aanr
	Ar1Uta1UWF17uwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvY1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
	6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwIxG
	rwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0J
	UfcTPUUUUU=
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
Message-ID-Hash: EL5IWTEMRR6YEHSACZHHBVO366A5NYDY
X-Message-ID-Hash: EL5IWTEMRR6YEHSACZHHBVO366A5NYDY
X-MailFrom: linma@zju.edu.cn
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: krzysztof.kozlowski@canonical.com, davem@davemloft.net, kuba@kernel.org, bongsu.jeon@samsung.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lin Ma <linma@zju.edu.cn>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] NFC: NULL out conn_info reference when conn is closed
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EL5IWTEMRR6YEHSACZHHBVO366A5NYDY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nci_core_conn_close_rsp_packet() function will release the conn_info
with given conn_id. However, this reference of this object may still held
by other places like ndev->rf_conn_info in routine:
.. -> nci_recv_frame()
     -> nci_rx_work()
       -> nci_rsp_packet()
         -> nci_rf_disc_rsp_packet()
           -> devm_kzalloc()
              ndev->rf_conn_info = conn_info;

or ndev->hci_dev->conn_info in routine:
.. -> nci_recv_frame()
     -> nci_rx_work()
       -> nci_rsp_packet()
         -> nci_core_conn_create_rsp_packet()
           -> devm_kzalloc()
              ndev->hci_dev->conn_info = conn_info;

If these two places are not NULL out, potential UAF can be exploited by
the attacker when emulating an UART NFC device. This patch compares the
deallocating object with the two places and writes NULL to prevent that.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/nfc/nci/rsp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index a2e72c003805..99de76e5e855 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -334,6 +334,14 @@ static void nci_core_conn_close_rsp_packet(struct nci_dev *ndev,
 							 ndev->cur_conn_id);
 		if (conn_info) {
 			list_del(&conn_info->list);
+			/* Other places held conn_info like
+			 * ndev->hci_dev->conn_info, ndev->rf_conn_info
+			 * need to be NULL out.
+			 */
+			if (ndev->hci_dev->conn_info == conn_info)
+				ndev->hci_dev->conn_info = NULL;
+			if (ndev->rf_conn_info == conn_info)
+				ndev->rf_conn_info = NULL;
 			devm_kfree(&ndev->nfc_dev->dev, conn_info);
 		}
 	}
-- 
2.33.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
