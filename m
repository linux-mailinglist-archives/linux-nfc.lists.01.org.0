Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21193FD489
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Sep 2021 09:39:46 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 778A6100EB826;
	Wed,  1 Sep 2021 00:39:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=61.164.42.155; helo=zju.edu.cn; envelope-from=linma@zju.edu.cn; receiver=<UNKNOWN> 
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
	by ml01.01.org (Postfix) with ESMTP id 08948100EBB9E
	for <linux-nfc@lists.01.org>; Wed,  1 Sep 2021 00:39:38 -0700 (PDT)
Received: by ajax-webmail-mail-app3 (Coremail) ; Wed, 1 Sep 2021 15:39:36
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.42.255]
Date: Wed, 1 Sep 2021 15:39:36 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: LinMa <linma@zju.edu.cn>
To: linux-nfc@lists.01.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
MIME-Version: 1.0
Message-ID: <5b6649e2.af5bf.17ba04c8d62.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: cC_KCgBXV2w4Li9hMwBPBA--.35388W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwQKElNG3D2ONAAVsE
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
Message-ID-Hash: I7ZL66LC6HH2DNIEM7RHFZGYX3W7L37D
X-Message-ID-Hash: I7ZL66LC6HH2DNIEM7RHFZGYX3W7L37D
X-MailFrom: linma@zju.edu.cn
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Content-Filtered-By: Mailman/MimeDel 3.1.1
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] set dev->rfkill to NULL in device cleanup routine
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/I7ZL66LC6HH2DNIEM7RHFZGYX3W7L37D/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In nfc_unregister_device() function, the dev->rfkill is forgotten to set to NULL after the rfkill_destroy(). This may lead to possible cocurrency UAF in other functions like nfc_dev_up().



The FREE chain is like


void nfc_unregister_device(struct nfc_dev *dev)
{
  int rc;
  pr_debug("dev_name=%s\n", dev_name(&dev->dev));
  if (dev->rfkill) {
    rfkill_unregister(dev->rfkill);
    rfkill_destroy(dev->rfkill);
  // ......
}



The USE chain is like


static int nfc_genl_dev_up(struct sk_buff *skb, struct genl_info *info)
{
  struct nfc_dev *dev;
  int rc;
  u32 idx;
  if (!info->attrs[NFC_ATTR_DEVICE_INDEX])
    return -EINVAL;
  idx = nla_get_u32(info->attrs[NFC_ATTR_DEVICE_INDEX]);
  dev = nfc_get_device(idx);
  if (!dev)
    return -ENODEV;
  rc = nfc_dev_up(dev);

  // ......
}


int nfc_dev_up(struct nfc_dev *dev)
{
  int rc = 0;
  pr_debug("dev_name=%s\n", dev_name(&dev->dev));
  device_lock(&dev->dev);
  if (dev->rfkill && rfkill_blocked(dev->rfkill)) { // dev->rfkill is not NULL here
    rc = -ERFKILL;
    goto error;
  }
  // ......
}


The FREE chain and USE chain can be like below (as there is no locking protection).


Therefore, the below patch can be added.


Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/nfc/core.c | 1 +
 1 file changed, 1 insertion(+)
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 573c80c6ff7a..d0b3224e65d7 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -1157,6 +1157,7 @@ void nfc_unregister_device(struct nfc_dev *dev)
  if (dev->rfkill) {
  rfkill_unregister(dev->rfkill);
  rfkill_destroy(dev->rfkill);
+ dev->rfkill = NULL;
  }
  if (dev->ops->check_presence) {
--
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
