Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7F2E7DD0
	for <lists+linux-nfc@lfdr.de>; Thu, 31 Dec 2020 03:59:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id ADF6B100EBBB1;
	Wed, 30 Dec 2020 18:59:44 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id B8E7B100EBBAF
	for <linux-nfc@lists.01.org>; Wed, 30 Dec 2020 18:59:42 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2so10616519pfq.5
        for <linux-nfc@lists.01.org>; Wed, 30 Dec 2020 18:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mIbBu5oerFY8oojdjY4H3fodNxd3UBrAe//XF172Q2U=;
        b=PjJQpR/g7gNVNgz0zU42o4JzpwTUUVxuVc7Aa/jKd6/5Wb/Xt26UNZZw5Y46KO37er
         4a7xdqTuQlChEf2WY0J94ZvkovV1AgHFdw7kXNhkGSVU7eyqyy2AWEqDLfhKUlSkcT9q
         1kgaVkVRp9cukQToCQoO7ZoPNt6/looPtGs8LqBlMDfMahYVnWLTFqptEDVeFhQIO+Du
         7hbCXzSBTMGk1K/clPEHsSG3ApyNTjutkm9BrmLUhMOKJQcKFfXu1+zxZ1fKF2/Hck7y
         1no1ocw995UnWJXTGt1Py7ts/aYsw3McnWXRI8pPAWQ5oCuEAtgFTdanD7AxuitmGPQt
         BGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mIbBu5oerFY8oojdjY4H3fodNxd3UBrAe//XF172Q2U=;
        b=eaCpf+1n8yPz1bGyEtKQL9GhW5BwkfIz9kHOjabmWOABO4zXfKmvOIHdDuwJfAbtzt
         akQ3uqLgpHBRLiN9LIYDXSAGAOVzczECqM/DVA+8n0S+6yPonCUU76TJddCyRWWa1Kkg
         u8szhR+BncmPC41GjPU01ZILbSZTv/iU0mD97o27k68uvP3nGU0NLIeVEMLzBCBMqR7u
         NBRCYcnRQT+Ku55t8j0k0XsckWnupcXtGAi+aW9YLDxjDHSHgkZOn0I47ssJIOanPnF2
         MUOabZt+6dUor/cXMUZ7ifekYAqjqp5Hnh1f18O2lUl95v1YUUW1QIPMc1kZO8TDmJZC
         2+4Q==
X-Gm-Message-State: AOAM5325Y/82EblIKubvgGpdvlKsWpDMwFwU2rPmm/Bdop/owAnIpecv
	fF4sv3/4aGwOyikoXTpeSz0=
X-Google-Smtp-Source: ABdhPJx0ge96w+D+4B6R2ghpq/z3f+0RNeOtatEh7iILDHxSWqYYpNp/gFmvp+7+tCVKmdb465AL/g==
X-Received: by 2002:a63:c009:: with SMTP id h9mr27776538pgg.119.1609383581687;
        Wed, 30 Dec 2020 18:59:41 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id b72sm43524740pfb.129.2020.12.30.18.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 18:59:40 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: davem@davemloft.net,
	kuba@kernel.org
Date: Thu, 31 Dec 2020 11:59:26 +0900
Message-Id: <20201231025926.2889-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: PZVGY6KBWHLONRGFXBNG753OYUFSNGTO
X-Message-ID-Hash: PZVGY6KBWHLONRGFXBNG753OYUFSNGTO
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next v2] net: nfc: nci: Change the NCI close sequence
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PZVGY6KBWHLONRGFXBNG753OYUFSNGTO/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

If there is a NCI command in work queue after closing the NCI device at 
nci_unregister_device, The NCI command timer starts at flush_workqueue
function and then NCI command timeout handler would be called 5 second 
after flushing the NCI command work queue and destroying the queue.
At that time, the timeout handler would try to use NCI command work queue
that is destroyed already. it will causes the problem. To avoid this 
abnormal situation, change the sequence to prevent the NCI command timeout
handler from being called after destroying the NCI command work queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

Changes in v2:
 - Change the commit message.

 net/nfc/nci/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index e64727e1a72f..79bebf4b0796 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -579,11 +579,11 @@ static int nci_close_device(struct nci_dev *ndev)
 
 	clear_bit(NCI_INIT, &ndev->flags);
 
-	del_timer_sync(&ndev->cmd_timer);
-
 	/* Flush cmd wq */
 	flush_workqueue(ndev->cmd_wq);
 
+	del_timer_sync(&ndev->cmd_timer);
+
 	/* Clear flags */
 	ndev->flags = 0;
 
-- 
2.17.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
