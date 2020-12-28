Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AACF2E337E
	for <lists+linux-nfc@lfdr.de>; Mon, 28 Dec 2020 02:46:49 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 43459100ED4BA;
	Sun, 27 Dec 2020 17:46:47 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 47ED6100ED4AC
	for <linux-nfc@lists.01.org>; Sun, 27 Dec 2020 17:46:45 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id v1so5177957pjr.2
        for <linux-nfc@lists.01.org>; Sun, 27 Dec 2020 17:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=M7WvI72wl4WUEMHOhb+lrKhfdYvvrF6GMV1dg1VMpQc=;
        b=d27FTPDqa40m8Gq0jAM0JQ21hyBIelFtGhpLuyYUu3Un4u30e5R7gBFiCVfb0n0E/N
         +3lw67S6Ztfi5pDuQjaB5MeLNnidR1bUWtX9bWln+Q1yH+5yo9DlKhKiVMr+Tsy4GhIP
         f4O7RwPnp2We+Iq38rrpr5A4Njo/R2DnYNAl/HOWKqhXN90xnmpDHpH0n0t9ponbKZSk
         tQsZpX517b2fNx5vYUgQOM47Z1HJO2TVd5K0N57KHQcY1U/SQ/e96l4WI44ft9bkOJ7u
         Qmtl1qA8O8wMYkA136FfPp+9DmxPOANrs1KJNUGVPPxovMB/Y+xuVCpR980uKMIpP8/v
         rpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M7WvI72wl4WUEMHOhb+lrKhfdYvvrF6GMV1dg1VMpQc=;
        b=hM+qkz4zv6vhMoUZTQQbVDlVRjFZbdzrM8vkL/tWZxkjF10Vq9DY7ZvJboenyEmcw3
         I5m8aASVZzwJ2gwpd1p/bWkVGBDA/XS/heWoGpLwnbjqiwYgMMENCY7kN7tBCeghIxy4
         BlhJzeJNzO1/+n7HQ8UbxQ5JIICC/UySbt87MxZWncMwgrKEh6VuU86ayLzCfzFnzNMZ
         W65WZRPy3qNSCqk98N7cM6UC/2fiimMMJ2JVt7fGiir1QOfVaJ+fzdxHBphtHg8kk16t
         Bgwrc6NEZggr4JKEQMQKphjnr0c9Izc9ywclnspNc4C9JI3qzW5p7Gorm8nSAMHBW1ou
         52xw==
X-Gm-Message-State: AOAM532XdHPkbgISzKAgca41l9RubXtsjCF0gLcR02ma5qFBzAq2urry
	fr8oVUQhNTfGf+y88E6MvOo=
X-Google-Smtp-Source: ABdhPJzXnMa13lXrovP0yhARfbP6Y1l2a0JaHzpYO7B2/f2mEt/w9mo26TYEkenv4zix1BXI+y65cA==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id r7mr19379497pjr.33.1609120004569;
        Sun, 27 Dec 2020 17:46:44 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id q4sm10145896pgr.39.2020.12.27.17.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 17:46:43 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: davem@davemloft.net,
	kuba@kernel.org
Date: Mon, 28 Dec 2020 10:46:31 +0900
Message-Id: <20201228014631.5557-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: LOGSXCMFKD36YEH3IVFY7NTIQJIIUWD2
X-Message-ID-Hash: LOGSXCMFKD36YEH3IVFY7NTIQJIIUWD2
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net-next] net: nfc: nci: Change the NCI close sequence
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LOGSXCMFKD36YEH3IVFY7NTIQJIIUWD2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Change the NCI close sequence because the NCI Command timer should be
deleted after flushing the NCI command work queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
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
