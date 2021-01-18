Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC8D2FABF0
	for <lists+linux-nfc@lfdr.de>; Mon, 18 Jan 2021 21:55:37 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E2458100EBBD0;
	Mon, 18 Jan 2021 12:55:35 -0800 (PST)
Received-SPF: None (no SPF record) identity=no SPF record; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=<>; receiver=<UNKNOWN> 
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4F214100EBBC3
	for <linux-nfc@lists.01.org>; Mon, 18 Jan 2021 12:55:33 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id m5so10645432pjv.5
        for <linux-nfc@lists.01.org>; Mon, 18 Jan 2021 12:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ruFco5xWA/+b9SdvAnrzJirm3DFQidkDyFrYUFYOIhM=;
        b=PHUIVUA+UHyfkRIww6QRky8yjEn2KLoiiu3EiEutYGjX5M6nIhWyr7svc8q/o3BJlX
         PFD3h/XUkiBtVLxTd3sM1b5sZNfb7df63igcgpDb2fiNM+zHgJORr1EzBWHloAnorD8o
         /v37Duq+K5Y3tFsK2CD6IW1MHRlsMb32iuzX13rR6lUIS/FB3MdxFc9Zv93WvY1nvRIV
         68ox6/x1DihkYxrvmvnZ6nq5oASFQMAUYMcgxvzzpF4wp1GJjq/cO6mwbyFi4p1ztpW3
         7gfBTzgwhg+eKcg3/2yTH7hWIqSJmW+LLZ8pGS9Cs/wii3oAN+hpTLEEaU4Nv8Xd4Emr
         3R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ruFco5xWA/+b9SdvAnrzJirm3DFQidkDyFrYUFYOIhM=;
        b=JesdqqlPVSKVDC6pb900WeaPZZThFlUZvR7dg2HpHo5dDtj0pwo26sk5Vtk3pql8NB
         hMaV1RH5V+EopijUG9CC+QH9Jxp8viRG3Gi9VTXNeQVrnrvfZws5DThbt+hzZbsNIMn6
         d5gw3U+rA3htMpHAJaymKfrTOcNPckiXj0GDMx5GH2Lba317f394lG84i/1DTzTuJMBW
         CsdNBX+dpfoYdkBfIsSzy1MDjv8ZTRrh4On221exBVkG9lh3SlfKX1kyWiPVwCvvaerp
         SYDyll8w0bXHraxFqFtfekve8l/cz1xrtrz2WK2W9xWvQQD2wfCvV9jkqsQYOkCqBvYp
         blNQ==
X-Gm-Message-State: AOAM533p1B7MOaUPfsfvb9+0vPQbqEflb4LVdEiuzhy60QNjVZwKeerx
	KUtaj/oGCS4sjr8acOOQQ4I=
X-Google-Smtp-Source: ABdhPJyPT2W/Qas4x40xT79rgOIhRxTbqaBcyEflSf75Ca4VkIGC2xg7T6HCGH8gZ69HdAcNCx6cKw==
X-Received: by 2002:a17:90a:4490:: with SMTP id t16mr1247891pjg.55.1611003332605;
        Mon, 18 Jan 2021 12:55:32 -0800 (PST)
Received: from localhost.localdomain ([182.226.226.37])
        by smtp.googlemail.com with ESMTPSA id k11sm16843653pgt.83.2021.01.18.12.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 12:55:31 -0800 (PST)
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
X-Google-Original-From: Bongsu Jeon
To: davem@davemloft.net,
	kuba@kernel.org
Date: Tue, 19 Jan 2021 05:55:22 +0900
Message-Id: <20210118205522.317087-1-bongsu.jeon@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Message-ID-Hash: PLZJISKGKOESAMGTNL55XNYXEY6WRSRY
X-Message-ID-Hash: PLZJISKGKOESAMGTNL55XNYXEY6WRSRY
X-MailFrom: <>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PLZJISKGKOESAMGTNL55XNYXEY6WRSRY/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
but there is no parameters in NCI1.x.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 net/nfc/nci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index e64727e1a72f..02a1f13f0798 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -508,7 +508,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		};
 		unsigned long opt = 0;
 
-		if (!(ndev->nci_ver & NCI_VER_2_MASK))
+		if (ndev->nci_ver & NCI_VER_2_MASK)
 			opt = (unsigned long)&nci_init_v2_cmd;
 
 		rc = __nci_request(ndev, nci_init_req, opt,
-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
